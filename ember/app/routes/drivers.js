var DriversRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin, {
    model: function () {
        return $.getJSON(ENV.api.drivers);
    }
});

export default DriversRoute;
