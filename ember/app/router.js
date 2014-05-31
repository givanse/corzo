var Router = Ember.Router.extend({
  location: ENV.locationType
});

Router.map(function() {
    this.route('about');
    this.resource('drivers', function () {
        this.route('show', {path: ':driver_id'});
    });
});

export default Router;
