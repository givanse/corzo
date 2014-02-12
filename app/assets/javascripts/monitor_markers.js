
/**
 *
 */
monitor.markers = {

    createPlaceResultMarker: null,
    createServicePositionMarker: null,
    createTaxiMarker: null,
    createTaxiMarkerInfoWindow: null

};

/**
 * map: google.maps.Map
 * placeResult: google.maps.places.PlaceResult
 */
monitor.markers.createPlaceResultMarker = function(map, placeResult) {
    var markerImage = {
        url: placeResult.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
    };
    var marker = new google.maps.Marker({
        map: map,
        icon: markerImage,
        title: placeResult.name,
        position: placeResult.geometry.location
    });
    
    return marker;    
}; /* createPlaceResultMarker */

/**
 * map: google.maps.Map
 * imgFileName: string
 * title: string
 */
monitor.markers.createServicePositionMarker = function(map, imgFileName, title) {
    var markerImage = {
        url: monitor.img.FOLDER + imgFileName,
        size: new google.maps.Size(32, 32),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(16, 32)
    };
    var marker = new google.maps.Marker({
        map: map,
        icon: markerImage,
        title: title
    });
    
    return marker;    
}; /* createServicePositionMarker */

/**
 *
 */
monitor.markers.createTaxiMarker = function(map, plate, latitude, longitude, driver_status_id, icon_base_name) {   
    /**
     * Create marker. 
     */                                              
    var image = {                     
        url: monitor.img.FOLDER + driver_status_id + icon_base_name,
        // This marker is 20 pixels wide by 32 pixels tall.              
        size: new google.maps.Size(48, 57),                              
        // The origin for this image is 0,0.                             
        origin: new google.maps.Point(0, 0),                             
        // The anchor for this image is the base of the flagpole at 0,32.
        anchor: new google.maps.Point(24, 57)                            
    };                                                                   

    var marker = new google.maps.Marker({      
        icon: image,
        title: plate,
        position: new google.maps.LatLng(latitude, longitude) 
    });

    /**
     * Add InfoWindow with Driver and Vehicle details.
     */
    var infoWindow = monitor.markers.createTaxiMarkerInfoWindow(driver_status_id, plate);
     
    google.maps.event.addListener(marker, 'click', function() {
            infoWindow.setPosition(marker.position);
            infoWindow.open(map);
    });

    return marker;
}; /* createTaxiMarker */

monitor.markers.createTaxiMarkerInfoWindow = function(driver_status_id, plate) {   
    var infoWindow = new google.maps.InfoWindow();

    var driver_name = "Pedro Picapiedra";
    var driver_id = 1;
    var vehicle_id = 1;

    var vehicleInfo = $("div#driver-vehicle-info").clone()
                                                  .css("display", "block");

    vehicleInfo.children("select#driver-status")
               .children("#" + driver_status_id)
               .get(0)
               .setAttribute("selected", "selected");

    vehicleInfo.children("#vehicle-link")
               .text(plate)
               .get(0)
               .setAttribute("href", "admin/vehicles/" + vehicle_id);

    vehicleInfo.children("#driver-link")
               .text(driver_name)
               .get(0)
               .setAttribute("href", "admin/drivers/" + driver_id);

    /* insert to InfoWindow */
    var wrapperDiv = $('<div>');
    vehicleInfo.appendTo(wrapperDiv);
    infoWindow.setContent(wrapperDiv.html());

    /* Add events until the InfoWindow's DOM is ready (available). */
    google.maps.event.addListener(infoWindow, 'domready', function() {

        /* Update the driver's status. */
        var selectDriverStatus = $('div#driver-vehicle-info select#driver-status');

        selectDriverStatus.change(
            function() { 
                monitor.ajax.setDriverStatus(selectDriverStatus);
            }
        );

        /* Update the New Service Form.*/
        $("div#driver-vehicle-info button#assign").click(
            function() {
                $("#nsf-ui #col3 #select-driver").val(driver_name);
            }
        );

    });

    return infoWindow;
}; /* createTaxiMarkerInfoWindow */

/* EOF */
