import Ember from 'ember';

export default Ember.View.extend({
  // https://github.com/stefanpenner/ember-cli/issues/820
  afterRenderEvent: function () {
    this.get('controller').send('initGoogleMap');
  }
});
