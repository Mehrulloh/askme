class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(users_param)

    redirect_to root_path, notice: "Вы успешно зарегистрировались!"
  end

  private

  def users_param
    params.require(:user).permit(:name, :nickname, :email)
  end
end
