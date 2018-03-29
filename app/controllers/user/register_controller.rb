class User::RegisterController < ApplicationController
  def new
  end

  def create
    puts "PARAMS ==== #{user_params}"
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/user'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end
end