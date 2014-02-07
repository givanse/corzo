//
//= require jquery
//= require jquery-ui
//= require i18n/jquery.ui.datepicker-es
//= require jquery.timepicker
//= require_self
//= require monitor_ajax
//= require monitor_controls
//= require monitor_markers
//= require monitor_init

/**
 * Monitor
 */
var monitor = {

    /* google maps objects */
    map: null,
    geocoder: new google.maps.Geocoder(),
    infoWinA: new google.maps.InfoWindow(),
    infoWinB: new google.maps.InfoWindow(),
    markerPosA: null,
    markerPosB: null,

    /* monitor globals */
    currSelectedPos: null,
    contextMenu: null,
    img: {
        FOLDER: 'img/', 
        TAXI_BASE_NAME: 'taxi-48.png'
    },

    /* sub-namespaces */
    ajax: null,
    controls: null,
    markers: null
    
}; /* monitor namespace */

/* EOF */