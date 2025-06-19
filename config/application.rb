require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Store
  class Application < Rails::Application
    config.load_defaults 8.0
    config.api_only = false

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    config.autoload_lib(ignore: %w[assets tasks])
  end
end
