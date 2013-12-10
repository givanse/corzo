require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Corzo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    I18n.enforce_available_locales = true
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config/locales/', '*.{rb,yml}').to_s]
    config.i18n.available_locales = ['es_MX', :en] 
    config.i18n.locale = 'es_MX' 
    config.i18n.default_locale = 'es_MX'

    # Devise
    # If you are deploying on Heroku with Rails 3.2 only, you may want to
    # forcing your application to not access the DB 
    # or load models when precompiling your assets.
    config.assets.initialize_on_precompile = false

    # Bootstrap
    # Make bootstrap-sass compatible withe asset pipeline
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

  end
end
