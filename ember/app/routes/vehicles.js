var VehiclesRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin, {
    model: function () {
        return $.getJSON(ENV.api.vehicles);
    }
});

export default VehiclesRoute;
