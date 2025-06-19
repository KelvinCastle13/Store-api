class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      cookies.signed[:user_id] = {
        value: user.id, httponly: true,
        secure: !Rails.env.development?,
        same_site: Rails.env.development? ? :lax : :none
    }
      render json: { email: user.email, user_id: user.id }, status: :created
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    cookies.delete(:user_id, cookie_settings)
    render json: { message: "Logged out successfully" }
  end
end
#   private

#   def cookie_settings
#     if Rails.env.test?
#       { httponly: true }
#     else
#       { httponly: true, secure: true, same_site: "None" }
#     end
#   end
# end
