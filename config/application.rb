require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BullfrogWebsites
  class Application < Rails::Application
    config.stripe.publishable_key = 'pk_test_DamghPRSC1ziN0B1dGi74h5M'
  end
end
