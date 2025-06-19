class UsersController < ApplicationController
  def create
    @user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

      # if user.save
      render json: { message: "User Created" }, status: :created
    # else
    #   render json: { error: user.errors.full_message }, status: :bad_request
    # end
  end
end
