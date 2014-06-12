var ApplicationRoute = Ember.Route.extend(Ember.SimpleAuth.ApplicationRouteMixin, {
    beforeModel: function() {
        return this.csrf.fetchToken();
    }
});

export default ApplicationRoute;
