import startApp from 'gpsmonitor/tests/helpers/start-app';

var App, server;

module('Integration - Speaker Page', {
  setup: function() {
    App = startApp();
    var drivers = [
      {
        id: 1,
        name: 'Bugs Bunny'
      },
      {
        id: 2,
        name: 'Wile E. Coyote'
      },
      {
        id: 3,
        name: 'Yosemite Sam'
      }
    ];

    server = new Pretender(function() {
      this.get('/api/drivers', function(request) {
        return [200, {"Content-Type": "application/json"}, JSON.stringify({drivers: drivers})];
      });

      this.get('/api/drivers/:id', function(request) {
        var driver = drivers.find(function(driver) {
          if (driver.id === parseInt(request.params.id, 10)) {
            return driver;
          }
        });

        return [200, {"Content-Type": "application/json"}, JSON.stringify({driver: driver})];
      });
    });

  },
  teardown: function() {
    Ember.run(App, 'destroy');
    server.shutdown();
  }
});

test('Should allow navigation to the drivers page from the landing page', function() {
  visit('/').then(function() {
    click('a:contains("Drivers")').then(function() {
      equal(find('h3').text(), 'Drivers');
    });
  });
});

test('Should list all drivers', function() {
  visit('/drivers').then(function() {
    equal(find('a:contains("Bugs Bunny")').length, 1);
    equal(find('a:contains("Wile E. Coyote")').length, 1);
    equal(find('a:contains("Yosemite Sam")').length, 1);
  });
});

test('Should be able to navigate to a driver page', function() {
  visit('/drivers').then(function() {
    click('a:contains("Bugs Bunny")').then(function() {
      equal(find('h4').text(), 'Bugs Bunny');
    });
  });
});

test('Should be able visit a driver page', function() {
  visit('/drivers/1').then(function() {
    equal(find('h4').text(), 'Bugs Bunny');
  });
});
