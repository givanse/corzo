import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';
import Ember from 'ember';

Ember.MODEL_FACTORY_INJECTIONS = true;

var App = Ember.Application.extend({
  modulePrefix: 'gpsmonitor', // TODO: loaded via config
  Resolver: Resolver
});

loadInitializers(App, 'gpsmonitor');
loadInitializers(App, 'rails-csrf');

export default App;
