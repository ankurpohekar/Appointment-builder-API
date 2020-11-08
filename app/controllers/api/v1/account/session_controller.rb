class Api::V1::Account::SessionController < ApplicationController
  def create
  	data = params[:signin]
  	@user = User.find_by(email: data[:email])
  	if @user&.authenticate(data[:password])
  	  @token = JsonWebToken.encode(user_id: @user.id)
	    @time = Time.current + 24.hours.to_i
      @message = "user signed in successfully"
  	else
  	  render json: {error: "unauthorized request"}, status: :unauthorized
  	end
  end
end