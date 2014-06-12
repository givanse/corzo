var LoginController = Ember.Controller.extend(Ember.SimpleAuth.LoginControllerMixin, {
  authenticatorFactory: 'ember-simple-auth-authenticator:devise'
});

export default LoginController;
