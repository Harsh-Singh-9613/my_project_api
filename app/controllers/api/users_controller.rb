class Api::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      token = Jwt::TokenProvider.(user_id: user.id)
      render json: {user: user, token: token}
    else
      render json: {error: 'Error description'}, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name)
  end
end
