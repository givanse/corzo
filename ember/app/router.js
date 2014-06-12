var Router = Ember.Router.extend({
    location: ENV.locationType
});

Router.map(function() {
    this.route('about');
    this.route('login');

    this.resource('drivers');

    this.resource('vehicles', function () {
        this.route('show');
    });
});

export default Router;
