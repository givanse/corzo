
var DEBUG_AJAX=false;

var WEBROOT = 'http://localhost:3000/';

var URL_AJAX_LAT_LON = WEBROOT + 'vehicles/get_current_positions'; 
var URL_AJAX_LANDMARKS = WEBROOT + 'taxis/landmarks/getEnabled.json'; 
var URL_AJAX_UPDATE_TAXI_STATUS = WEBROOT + 'taxis/taxis/updateStatus'; 
var URL_AJAX_SERVICES_GET_FORTHCOMING = WEBROOT + 'services/get_forthcoming'; 

/* Configure AJAX */
$.ajaxSetup({cache: false, 
             dataType: 'json', 
             error: function(jqXHR, textStatus, errorThrown) {
                 if(DEBUG_AJAX === true) {
                    console.log('AJAX error: ' + textStatus + ', ' + errorThrown);
                    console.log(jqXHR);
                 }
             }
            });

var monitor_ajax = {

    /* Get the latest location reported by every taxi and update the map. */         
    updateTaxiLocationsOnMap: function (map) {                                         
        $.ajax(URL_AJAX_LAT_LON).done(function(data) {                               
            monitor_ajax.debugAJAXDone(URL_AJAX_LAT_LON, data);                                   
                                                                                 
            for (indx in data['taxisLatLon']) {                                      
                object = data['taxisLatLon'][indx];                                  
                taxiObject = object.Taxi;                                            
                addTaxiMarkerToMap(map, taxiObject);                                 
            }                                                                        
        })                                                                           
    },

    updateServicesWindow: function (servicesWindow) {
        $.ajax(URL_AJAX_SERVICES_GET_FORTHCOMING).done(function(data) {

            monitor_ajax.debugAJAXDone(URL_AJAX_SERVICES_GET_FORTHCOMING, data);

            var servicesControls = $('<div>').css({'position': 'absolute',
                                                       'top': '10px'});
            for (indx in data['services']) {
                var address = data['services'][indx].Service.address;
                var scheduled = data['services'][indx].Service.scheduled;
                $('<div>').append(address + '<br/>' + scheduled) 
                          .css({
                              'background-color': 'white', 
                              'color': 'black', 
                              'border-radius': '3px', 
                              'margin': '2px 5px 2px 5px', 
                              'padding': '0 2px 0 2px', 
                              'cursor': 'pointer',
                              'width': '140px'}) 
                          .appendTo(servicesControls); 
            }
            $(servicesWindow).append(servicesControls);
        })
    },

    
    /**
     * Add custom controls based on the Landmarks stored in the database.
     */
    addCustomControls: function (map) {
        $.ajax(URL_AJAX_LANDMARKS).done( function(data) {

            monitor_ajax.debugAJAXDone(URL_AJAX_LANDMARKS, data);

                for (indx in data['enabledLandmarks']) {
                    object = data['enabledLandmarks'][indx];
                    name = object.Landmark.name;
                    latitude = object.Landmark.latitude;
                    longitude = object.Landmark.longitude;

                    var geoLocation = new google.maps.LatLng(latitude, longitude);        
                    var locationControl = new monitor.LocationControl(map, name, geoLocation);
                    map.controls[google.maps.ControlPosition.TOP_LEFT].push(locationControl);
                }                                                 
        });
    },

    debugAJAXDone: function (url, data) {
        if(DEBUG_AJAX === true) {
            console.log('AJAX done: ' + url);
            console.log(data);
        }
    }

}; /* monitor_ajax namespace */

/* EOF */ 
