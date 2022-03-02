class Api::V1::AuthenticationsController < ApplicationController

  def authenticate
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    end
  end
end
