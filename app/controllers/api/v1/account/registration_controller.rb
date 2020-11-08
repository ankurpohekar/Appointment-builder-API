class Api::V1::Account::RegistrationController < ApplicationController
  
  def create
  	@user = User.new(signup_params)
  	if @user.save
  	  @message = "user signed up successfully"
  	else
  		render json: {error: @user.errors.full_messages.join(", ")}, status: :unprocessable_entity
  	end
  end

  private
  def signup_params
  	params.require(:signup).permit(:name, :email, :password, :password_confirmation)
  end
end