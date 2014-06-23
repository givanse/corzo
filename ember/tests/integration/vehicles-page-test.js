import startApp from 'gpsmonitor/tests/helpers/start-app';
import Pretender from 'vendor/pretender/pretender';

var App, server;

module('Integration - Vehicle Page', {
  setup: function() {
    App = startApp();
    var vehicles = [
      {
        id: 1,
        plate: 'Bugs Bunny'
      },
      {
        id: 2,
        plate: 'Wile E. Coyote'
      },
      {
        id: 3,
        plate: 'Yosemite Sam'
      }
    ];

    server = new Pretender(function () {
      this.get('/api/vehicles', function (request) {
        return [200, {"Content-Type": "application/json"}, 
                JSON.stringify({vehicles: vehicles})];
      });

      this.get('/api/vehicles/:id', function (request) {
        var vehicle = vehicles.find(function (vehicle) {
          if (vehicle.id === parseInt(request.params.id, 10)) {
            return vehicle;
          }
        });

        return [200, {"Content-Type": "application/json"}, 
                JSON.stringify({vehicle: vehicle})];
      });
    });

  }, /* setup */
  teardown: function() {
    Ember.run(App, 'destroy');
    server.shutdown();
  }
}); /* module */

test('Should allow navigation to the vehicles page from the landing page', function() {
  visit('/').then(function() {
    click('a:contains("Vehicles")').then(function() {
      equal(find('h3').text(), 'Vehicles');
    });
  });
});

test('Should list all vehicles', function() {
  visit('/vehicles').then(function() {
    equal(find('a:contains("Bugs Bunny")').length, 1);
    equal(find('a:contains("Wile E. Coyote")').length, 1);
    equal(find('a:contains("Yosemite Sam")').length, 1);
  });
});

test('Should be able to navigate to a vehicle page', function() {
  visit('/vehicles').then(function() {
    click('a:contains("Bugs Bunny")').then(function() {
      equal(find('h4').text(), 'Bugs Bunny');
    });
  });
});

test('Should be able visit a vehicle page', function() {
  visit('/vehicles/1').then(function() {
    equal(find('h4').text(), 'Bugs Bunny');
  });
});
