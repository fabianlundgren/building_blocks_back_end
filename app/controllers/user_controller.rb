class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @code = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
  end

  def create
    @user = User.new sign_up_params
    @user.building_id = session[:current_building_id]
    if @user.save
      flash[:notice] = "New user created!"
      redirect_to root_path
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :role, :password, :password_confirmation)
  end
end
