import Ember from 'ember';

var Router = Ember.Router.extend({
    location: GpsmonitorENV.locationType
});

Router.map(function() {
    this.route('about');

    this.route('login');

    this.resource('monitor');

    this.resource('drivers');

    this.resource('vehicles', function () {
        this.route('show');
    });
});

export default Router;
