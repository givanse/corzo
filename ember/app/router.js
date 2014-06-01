var Router = Ember.Router.extend({
  location: ENV.locationType
});

Router.map(function() {
    this.route('about');
    this.resource('drivers', function () {
        this.route('show', {path: ':driver_id'});
    });
    this.resource('vehicles', function () {
        this.route('show', {path: ':vehicle_id'});
    });
});

export default Router;
