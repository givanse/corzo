
/**
 *
 */
monitor.markers = {

    createPlaceResultMarker: null,
    createServicePositionMarker: null,
    createTaxiMarker: null

}; /* monitor_markers namespace */

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
monitor.markers.createTaxiMarker = function(plate, latitude, longitude, status) {    
    /* Add taxi markers. */                                              
    var image = {                                                        
        url: monitor.img.FOLDER + status + monitor.img.TAXI_BASE_NAME,                                          
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
    return marker;
}; /* createTaxiMarker */

/* EOF */