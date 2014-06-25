import Ember from 'ember';

export default Ember.Route.extend({
  renderNestedTemplate: function(name) {
    this.render(name, {
      outlet: name,
      into: 'monitor',
      controller: name
    });
  },

  renderTemplate: function(controller, model) {
    this._super(controller, model);
    this.renderNestedTemplate('new-task');
    this.renderNestedTemplate('scheduled-tasks');
  },

  setupController: function(controller, model) {
    this._super(controller, model);

    var stModel = [];
    this.controllerFor("scheduled-tasks").set("model", stModel);
  }
});
