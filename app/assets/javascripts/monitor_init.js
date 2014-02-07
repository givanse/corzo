/**
 * initialize_google_map
 */
function initialize_google_map() {

    // Enable the visual refresh
    google.maps.visualRefresh = true;

    var mapOptions = {
        center: new google.maps.LatLng(20.674226, -103.387363),
        zoom: 11,
        maxZoom: 18,
        disableDefaultUI: true,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        zoomControl: true,
        zoomControlOptions: {
            position: google.maps.ControlPosition.RIGHT_CENTER
        }
    };
    monitor.map = new google.maps.Map(document.getElementById("map-canvas"),
                                      mapOptions);
    /**
     * Delay customizations until the map has loaded.
     */
    google.maps.event.addListenerOnce(monitor.map, "tilesloaded", function(evt) {
        
        monitor.ajax.updateTaxiLocationsOnMap(monitor.map);

        /**
         * Search boxes initialization.
         */
        monitor.controls.addSearchBox(monitor.map, 
                                      document.getElementById("search-box-a") );
        monitor.controls.addSearchBox(monitor.map, 
                                      document.getElementById("search-box-b"));
        /* TODO: Review why calling directly
         searchBox.setBounds() wouldn't work. */
        var initialBounds = new google.maps.LatLngBounds(
            new google.maps.LatLng(20.94605,-103.795509),
            new google.maps.LatLng(20.454036,-102.860985));
        monitor.map.fitBounds(initialBounds);

        /**
         * Add scheduled services panel. 
         */
        var ssp = monitor.controls.buildScheduledServicesPanel();
        monitor.map.controls[google.maps.ControlPosition.TOP_RIGHT].push(ssp);
        monitor.ajax.updateScheduledServicesList("div#ssp-list");

        /** 
         * Add new service form. 
         */
        var tsf = monitor.controls.TransportServiceForm();
        monitor.map.controls[google.maps.ControlPosition.TOP_CENTER].push(tsf);

        /**
         * Initialize service position markers. This indicate the origin (A)
         * and destination (B) positions of a service request.
         */
        monitor.markerPosA = monitor.markers.createServicePositionMarker(
                                               monitor.map, "a.png", "origen");
        monitor.markerPosB = monitor.markers.createServicePositionMarker(
                                               monitor.map, "b.png", "destino");
    }); /* tilesloaded */

    /**
     * Add the context menu. 
     */
    monitor.contextMenu = monitor.controls.buildContextMenu("div#context-menu");
    google.maps.event.addListener(monitor.map, "rightclick", function(event) {
        var lat = event.latLng.lat();
        var lng = event.latLng.lng();
        monitor.currSelectedPos = new google.maps.LatLng(lat, lng);
        monitor.contextMenu.setPosition(monitor.currSelectedPos);
        monitor.contextMenu.open(monitor.map);
    });

} /* initialize_google_map */

/**
 * initialize_new_service_form
 */
function initialize_new_service_form() {
    /**
     * Select client number and/or full name
     */
    monitor.ajax.populateClientsList("#select-client");
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

} /* initialize_new_service_form */

$(document).ready(function() {
    initialize_google_map();
    initialize_new_service_form();
});

/* EOF */