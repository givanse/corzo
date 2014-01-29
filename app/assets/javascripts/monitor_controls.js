
var URL_IMG_TAXI_BASE_NAME = 'taxi-48.png';

var monitor_controls = {

    LocationControl: function(map, title, centerLocation) {

        // Setting padding to 5 px will offset the control
        // from the edge of the map.
        var controlDiv = $('<div>').attr('class', 'controlDiv') 
                               .css({'padding': '5px'})
                               .get(0);                 

        // Set CSS for the control border.                                           
        var controlUI = $('<div>').attr('class', 'controlUI')
                              .css({                                             
                              'background-color': 'white',                       
                              'color': '#4c4c4c',                                   
                              'border': 'solid 2px gray',                        
                              'cursor': 'pointer'})                             
                              .attr('title', 'Click to set the map to ' + title) 
                              .appendTo(controlDiv);

        // Set CSS for the control interior.                                         
        var controlText = $('<div>').css({                                           
                              'font-family': 'Arial,sans-serif',                 
                              'font-size': '12px',                               
                              'padding': '0 4px 0 4px'})                         
                              .append('<strong>' + title + '</strong>')          
                              .appendTo(controlUI);

        // Setup the click event listeners: simply set the map to Chicago.
        google.maps.event.addDomListener(controlUI.get(0), 'click', function() {
            map.setCenter(centerLocation)
            /* Eye-candy, add a marker. */
            var marker = new google.maps.Marker({                                        
                    position: centerLocation,               
                    title: title                                             
                });                                                                      
            marker.setMap(map);
        });

        return controlDiv;
    },

    buildScheduledServicesPanel: function() {
        /** 
         * Call .get(0) or you'll get this error:
         *     TypeError: a[w] is undefined
         *
         * The map does stuff with the controlDiv and expects the DOM object, not
         * the JQuery selector. 
         */
        return $("div#ssp").get(0);
    },

    buildNewServiceForm : function() {

        var minimizeButton = $("#nsf #nsf-ui #nsf-controls img").click(
            function() {
                var display = $("#nsf #nsf-ui .nsf-col").css("display");
                var displayValue = (display == "none") ? "block" : "none" ;
                $("#nsf #nsf-ui .nsf-col").css("display", displayValue);
            });

        /**                                                                             
         * Call .get(0) or you'll get this error:                                       
         *     TypeError: a[w] is undefined                                             
         *                                                                              
         * The map does stuff with the controlDiv and expects the DOM object, not       
         * the JQuery selector.            
         *
         * Used as a wrapper and for positioning within the map.                                             
         */                                                                          
        return $("div#nsf").get(0);                                          
    }

}; /* monitor_controls namespace */

function addTaxiMarkerToMap(map, taxiObject) {    
    var id = taxiObject._id;
    var plate = taxiObject.plate;
    var latitude = taxiObject.lastLatitude;
    var longitude = taxiObject.lastLongitude;
    var phone = taxiObject.driverCellphone;
    var status = taxiObject.status;
    var lastLocUpdate = taxiObject.modifiedLocation;
    var statusMsg = status == 0 ? 'Incomunicado' :                               
                    status == 1 ? 'Inactivo' :                                   
                    status == 2 ? 'Libre' :                                      
                    status == 3 ? 'Ocupado' : 'Error de sistema';

    var marker = createTaxiMarker(plate, latitude, longitude, status);
    marker.setMap(map);

    infoWindow = new google.maps.InfoWindow();

    // Listen for click event  
    google.maps.event.addListener(marker, 'click', function() { 
            var utilityDiv = $('<div>');
            var divTaxiInfo = $('<div id=\'TaxiInfo\'>').appendTo(utilityDiv);;

            var statusComboBox = $('<select>').attr('id', 'TaxiStatus')
                                              .attr('name', 'data[Taxi][status]')
                                              .appendTo(divTaxiInfo);
            $('<option>').attr({'value':'0'}).html('incomunicado').appendTo(statusComboBox);
            $('<option>').attr({'value':'1'}).html('inactivo').appendTo(statusComboBox);
            $('<option>').attr({'value':'2'}).html('libre').appendTo(statusComboBox);
            $('<option>').attr({'value':'3'}).html('ocupado').appendTo(statusComboBox);
            statusComboBox.children()[status].setAttribute('selected', 'selected');

            var taxiViewLink = '<a href=\'/taxis/taxis/view/' + id + '\'>' + plate + '</a>';
            var taxiInfo = '<br/>Última ubicación<br/>' + 
                           lastLocUpdate + '<br/>' + 
                           taxiViewLink + '<br/>' + 
                           phone;
            divTaxiInfo.append(taxiInfo);

            infoWindow.setContent(utilityDiv.html()); 
            infoWindow.setPosition(marker.position); 
            infoWindow.open(map); 
        });

    /* Add events until the InfoWindow's DOM is ready (available). */
    google.maps.event.addListener(infoWindow, 'domready', function() {
            var select = $('div#TaxiInfo select#TaxiStatus');
            select.change(function() { 
                        select.fadeTo(200, 0.33);
                        $.ajax({                                                                     
                            url: URL_AJAX_UPDATE_TAXI_STATUS,                                               
                            success: function(data) {                                            
                                //TODO: provide feedback
                            },                                                                
                            error: function(data) {                                            
                                //TODO: provide feedback
                            },                                                                
                            complete: function() {                                            
                                select.fadeTo(200, 1.0);
                            }                                                                
                        });                                                                    
                });
        });
}

function createTaxiMarker(plate, latitude, longitude, status) {    
    /* Add taxi markers. */                                              
    var image = {                                                        
            url: WEBROOT + 'img/' + status + URL_IMG_TAXI_BASE_NAME,                                          
            // This marker is 20 pixels wide by 32 pixels tall.              
            size: new google.maps.Size(48, 57),                              
            // The origin for this image is 0,0.                             
            origin: new google.maps.Point(0, 0),                             
            // The anchor for this image is the base of the flagpole at 0,32.
            anchor: new google.maps.Point(24, 57)                            
        };                                                                   

    var marker = new google.maps.Marker({                                
            position: new google.maps.LatLng(latitude, longitude),        
            title: plate,                                           
            icon: image                                                      
        });                                                                  
    return marker;
}

/* Add a search box to the map. */
function addSearchBox(map, inputField) {
    var markers = [];
    // Create the search box and link it to the UI element.
    var searchBox = new google.maps.places.SearchBox(inputField);

    // [START region_getplaces]
    // Listen for the event fired when the user selects an item from the
    // pick list. Retrieve the matching places for that item.
    google.maps.event.addListener(searchBox, 'places_changed', function() {
            var places = searchBox.getPlaces();

            for (var i = 0, marker; marker = markers[i]; i++) {
                marker.setMap(null);
            }

            // For each place, get the icon, place name, and location.
            markers = [];
            var bounds = new google.maps.LatLngBounds();
            for (var i = 0, place; place = places[i]; i++) {
                var image = {
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(25, 25)
                };

                // Create a marker for each place.
                var marker = new google.maps.Marker({
                    map: map,
                    icon: image,
                    title: place.name,
                    position: place.geometry.location
                });

                markers.push(marker);

                bounds.extend(place.geometry.location);
            }
            map.fitBounds(bounds);
        });
    // [END region_getplaces]

    // Bias the SearchBox results towards places that are within the bounds of the
    // current map's viewport.
    google.maps.event.addListener(map, 'bounds_changed', function() {
            var bounds = map.getBounds();
            searchBox.setBounds(bounds);
        });
}

/* EOF */
