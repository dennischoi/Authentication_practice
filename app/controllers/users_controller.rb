class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You signed up successfully!'
      redirect_to root_url
    else
      flash[:error] = 'Retry sign up... missing input!'
      render :new
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)

end
