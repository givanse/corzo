
monitor.controls = {
    
    locationControl: null,
    buildScheduledServicesPanel: null,
    TransportServiceForm: null,
    addSearchBox: null,
    buildContextMenu: null

}; /* monitor.controls namespace */

monitor.controls.locationControl = function(map, title, centerLocation) {

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
}; /* LocationControl */

monitor.controls.buildScheduledServicesPanel = function() {
    var minimizeButton = $("#ssp #ssp-ui #ssp-controls img").click(
        function() {
            var selectorString = "#ssp #ssp-ui .toggleable";

            var display = $(selectorString).css("display");
            var displayValue = (display == "none") ? "block" : "none" ;
            $(selectorString).css("display", displayValue);
        }
    );

    /** 
     * Call .get(0) or you'll get this error:
     *     TypeError: a[w] is undefined
     *
     * The map does stuff with the controlDiv and expects the DOM object, 
     * text node, not the JQuery node. 
     */
    return $("div#ssp").get(0);
}, /* buildScheduledServicesPanel */

monitor.controls.TransportServiceForm = function() {

    var minimizeButton = $("#nsf #nsf-ui #nsf-controls img").click(
        function() {
            var selectorString = "#nsf #nsf-ui .toggleable";

            var display = $(selectorString).css("display");
            var displayValue = (display == "none") ? "block" : "none" ;
            $(selectorString).css("display", displayValue);
        });

    /**                                                                             
     * Call .get(0) or you'll get this error:                                       
     *     TypeError: a[w] is undefined                                             
     *                                                                              
     * The map does stuff with the controlDiv and expects the DOM object, 
     * text node, not the JQuery node.            
     *
     * Used as a wrapper and for positioning within the map.                                             
     */                                                                          
    return $("div#nsf").get(0);                                          
}; /* buildNewServicesForm */

/**
 * Creates a search box, links it to the inputElement and adds it 
 * to the map. 
 * map: google.maps.Map
 * inputElement: <input>
 */
monitor.controls.addSearchBox = function(map, inputElement) {

    /* Create the search box and link it to the UI element. */
    var searchBox = new google.maps.places.SearchBox(inputElement);

    /**
     * Listen for the event fired when the user selects an item from the
     * pick list. Retrieve the matching places for that item.
     */
    var currPlacesMarkers = [];
    google.maps.event.addListener(searchBox, 'places_changed', function() {

        /* previous searches clean up */
        for (var i = 0, placeMarker; placeMarker = currPlacesMarkers[i]; i++) {
            placeMarker.setMap(null); 
        }

        // For each place, get the icon, place name, and location.
        currPlacesMarkers = [];
        var resultBounds = new google.maps.LatLngBounds();
        var placeResults = searchBox.getPlaces();
        for (var i = 0, placeResult; placeResult = placeResults[i]; i++) {
            var placeMarker = monitor.markers.createPlaceResultMarker(map, placeResult);
            currPlacesMarkers.push(placeMarker);

            resultBounds.extend(placeResult.geometry.location);
        }

        map.fitBounds(resultBounds);
    });
    
    /* 
     * Bias the SearchBox results towards places that are within the bounds 
     * of the current map's viewport.
     */
    google.maps.event.addListener(map, 'bounds_changed', function() {
        var bounds = map.getBounds();
        searchBox.setBounds(bounds);
    });

}; /* addSearchBox */

monitor.controls.buildContextMenu = function(menuWrapperId) {
    var contextMenu = new google.maps.InfoWindow();
                                    
    var menuWrapper = $(menuWrapperId);

    /* Insert the InfoWindow in the div received */
    var wrapperDiv = $("<div>");
    menuWrapper.appendTo(wrapperDiv);
    contextMenu.setContent(wrapperDiv.html());

    function setServicePosition(label, searchBox, marker, infoWindow) {
        monitor.contextMenu.close();

        var position = monitor.currSelectedPos;
        
        label.text(position);
        marker.setPosition(position);

        monitor.geocoder.geocode({'latLng': position}, 
            function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[1]) {
                        var address = results[1].formatted_address;
                        
                        infoWindow.setContent(address);
                        infoWindow.open(monitor.map, marker);

                        searchBox.val(address);
                    } else {
                        alert('No results found');
                    }
                } else {
                    alert('monitor.geocoder failed due to: ' + status);
                }
            }
        );
    } /* setServicePosition */

    /**
     * Set origin and destination position.
     * onclick event: http://stackoverflow.com/a/19237302/7852
     */
    $(document).on("click", "button#set-a", function() {
        setServicePosition( $("label#coords-a"), $("#search-box-a"), 
                            monitor.markerPosA, monitor.infoWinA);
    });
    $(document).on("click", "button#set-b", function() {
        setServicePosition( $("label#coords-b"), $("#search-box-b"), 
                            monitor.markerPosB, monitor.infoWinB);
    });

    return contextMenu;
}; /* buildContextMenu */

/* EOF */