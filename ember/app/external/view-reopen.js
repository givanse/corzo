import Ember from 'ember';

export default Ember.View.reopen({
  didInsertElement: function () {
    this._super();
    Ember.run.scheduleOnce('afterRender', this, this.afterRenderEvent);
  },
  afterRenderEvent: function () {
    // Implement this hook in your own subclasses and run your jQuery logic there.
    // Do not add code here as this fires after EVERY didInsertElement event
  }
});
