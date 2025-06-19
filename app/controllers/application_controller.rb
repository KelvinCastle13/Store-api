class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Add this line to disable CSRF check for JSON/API requests
  skip_before_action :verify_authenticity_token, if: -> { request.format.json? }
end
