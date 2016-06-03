class UsersController < ApplicationController
  def new
    @new = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      UserMailer.test_email(@user.email).deliver_later
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
