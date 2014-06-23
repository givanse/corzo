import Ember from 'ember';

export default Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin, {
    model: function () {
        return Ember.$.getJSON(GpsmonitorENV.api.vehicles);
    }
});
