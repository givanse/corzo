import Ember from 'ember';

export default Ember.Controller.extend({

  initGoogleMap: function () {
    //TODO: Optimize, not always is necessary to instantiate the whole map, right?

    // Enable the visual refresh
    google.maps.visualRefresh = true;

    var mapOptions = {
      center: new google.maps.LatLng(20.674226, -103.387363),
      zoom: 11,
      maxZoom: 18,
      disableDefaultUI: true,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      streetViewControl: true,
      zoomControl: true,
      // TODO http://stackoverflow.com/a/9773082/7852
      zoomControlOptions: {
        position: google.maps.ControlPosition.RIGHT_CENTER
      }
    };

    var map = new google.maps.Map(document.getElementById("map-canvas"),
                                  mapOptions); 
    //this.set('map', map);

    var self = this;
    //google.maps.event.addListenerOnce(map, "tilesloaded", function (evt) {
      self.initGoogleMapComponents(map);
    //});
  },

  initGoogleMapComponents: function (map) {
    /**
     * Add scheduled tasks panel.
     */
    var stc = $("#scheduled_tasks_control").get()[0];
    map.controls[google.maps.ControlPosition.TOP_RIGHT].push(stc);

    /**
     * Add new task panel.
     */
    var ntc = $("#new_task_control").get()[0];
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(ntc);
  }, /* initGoogleMapComponents */

  /*
   Google map instance
   */
  map: null

});
