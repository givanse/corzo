//
//= require jquery
//= require jquery-ui
//= require i18n/jquery.ui.datepicker-es
//= require jquery.timepicker
//= require monitor_controls
//= require monitor_ajax
//= require_self

// Enable the visual refresh
google.maps.visualRefresh = true;

var theMap = null;
var geocoder = null;

var contextMenu = null;

var currentlySelectedPosition = null;



var monitor = {

    setServicePosition: function(label, searchBox, marker, infoWindow) {
        contextMenu.close();

        var position = currentlySelectedPosition;

        label.text(position);
        marker.setPosition(position);

        geocoder.geocode({'latLng': position}, 
            function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[1]) {
                        var address = results[1].formatted_address;
                        
                        infoWindow.setContent(address);
                        infoWindow.open(theMap, marker);

                        searchBox.val(address);
                    } else {
                        alert('No results found');
                    }
                } else {
                    alert('Geocoder failed due to: ' + status);
                }
            }
        );
    } /* setServicePosition */
    
} /* monitor namespace */

monitor.infoWinA = new google.maps.InfoWindow();
monitor.infoWinB = new google.maps.InfoWindow();
monitor.markerPosA = null;
monitor.markerPosB = null;

/**
 *
 */
function initialize_google_map() {

    var mapOptions = {
        center: new google.maps.LatLng(20.674226, -103.387363),
        zoom: 11,
        maxZoom: 18,
        disableDefaultUI: true,
        mapTypeId: google.maps.MapTypeId.ROADtheMap,
        zoomControl: true,
        zoomControlOptions: {
            position: google.maps.ControlPosition.RIGHT_CENTER
        }
    };

    theMap = new google.maps.Map(document.getElementById("map-canvas"),
                                     mapOptions);
    geocoder = new google.maps.Geocoder();

    /**
     * Delay customizations until the map has loaded.
     */
    google.maps.event.addListenerOnce(theMap, "tilesloaded", function(evt) {

        monitor_ajax.updateTaxiLocationsOnMap(theMap);

        /**
         * Search boxes initialization.
         */
        monitor_controls.addSearchBox(theMap, 
                                      document.getElementById("search-box-a") );
        monitor_controls.addSearchBox(theMap, 
                                      document.getElementById("search-box-b"));
        /* TODO: Review why calling directly
         searchBox.setBounds() wouldn't work. */
        var initialBounds = new google.maps.LatLngBounds(
        new google.maps.LatLng(20.94605,-103.795509),
        new google.maps.LatLng(20.454036,-102.860985));
        theMap.fitBounds(initialBounds);

        /**
         * Add scheduled services panel. 
         */
        var ssp = monitor_controls.buildScheduledServicesPanel();
        theMap.controls[google.maps.ControlPosition.TOP_RIGHT].push(ssp);
        monitor_ajax.updateScheduledServicesList("div#ssp-list");

        /** 
         * Add new service form. 
         */
        var nsf = monitor_controls.buildNewServiceForm();
        theMap.controls[google.maps.ControlPosition.TOP_CENTER].push(nsf);

        /**
         * Initialize service position markers. This indicate the origin (A)
         * and destination (B) positions of a service request.
         */
        monitor.markerPosA = monitor_markers.createServicePositionMarker(
                                                    theMap, "a.png", "origen");
        monitor.markerPosB = monitor_markers.createServicePositionMarker(
                                                    theMap, "b.png", "destino");
    }); /* tilesloaded */

    /**
     * Add the context menu. 
     */
    contextMenu = monitor_controls.buildContextMenu();

    google.maps.event.addListener(theMap, "rightclick", function(event) {
        var lat = event.latLng.lat();
        var lng = event.latLng.lng();
        currentlySelectedPosition = new google.maps.LatLng(lat, lng);

        contextMenu.setPosition(currentlySelectedPosition);
        contextMenu.open(theMap);
    });

} /* initialize_google_map */

function init_new_service_form() {
    /**
     * Select client number and/or full name
     */
    monitor_ajax.populateClientsList("#select-client");
    $( "#select-client" ).change(function() {
        var option = this.options[this.selectedIndex];
        var client_id = option.value;
        var client_name = option.getAttribute("name");
        $( "#full-name" ).val(client_name)
                         .attr("cid", client_id);
    });
    /**
     * Select date and time.
     */
    $( "#select-date" ).datepicker({ option: $.datepicker.regional[ "es" ],
                                     minDate: "-0D",
                                     maxDate: "+1M"});
    $( "#select-time" ).timepicker({ scrollDefaultNow: true,
                                     scrollDefaultTime: true,
                                     step: 15,
                                     timeFormat: "h:i A"});
    /**
     * Set origin and destination position.
     *
     * onclick event: http://stackoverflow.com/a/19237302/7852
     */
    $(document).on("click", "button#set-a", function() {
        monitor.setServicePosition( $("label#coords-a"), $("#search-box-a"), 
                                    monitor.markerPosA, monitor.infoWinA);
    });
    $(document).on("click", "button#set-b", function() {
        monitor.setServicePosition( $("label#coords-b"), $("#search-box-b"), 
                                    monitor.markerPosB, monitor.infoWinB);
    });

} /* init_new_service_form */

$(document).ready(function() {
    initialize_google_map();
    init_new_service_form();
});

/* EOF */
