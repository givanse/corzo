import Ember from 'ember';

export default Ember.Controller.extend({
 
  createGMapControl: function(menuWrapperId) {
    var contextMenu = new google.maps.InfoWindow();
                                    
    var menuWrapper = Ember.$(menuWrapperId);

    /* Insert the InfoWindow in the div received */
    var wrapperDiv = Ember.$("<div>");
    menuWrapper.appendTo(wrapperDiv);
    contextMenu.setContent(wrapperDiv.html());

    return contextMenu;
  },

  initGMapControl: function(map) {
    var cm = this.createGMapControl("#context_menu");
    google.maps.event.addListener(map, "rightclick", function(event) {
      var lat = event.latLng.lat();
      var lng = event.latLng.lng();
      var clickedPos = new google.maps.LatLng(lat, lng);
      cm.setPosition(clickedPos);
      cm.open(map);
      Ember.$("#context_menu").attr("class", "");
    });
  }

});
