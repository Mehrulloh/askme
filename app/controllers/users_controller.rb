class UsersController < ApplicationController

  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to new_session_url, notice: "Вы успешно зарегистрировались!"
    else
      flash.now[:alert] = "Вы неправильно заполнили поля формы регистрации"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(users_params)
      redirect_to root_path, notice: "Данные пользователья обновлены!"
    else
      flash.now[:alert] = "При попытке сохранить пользователья возникли ошибки"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: "Пользователь удалён"
  end

  private

  def users_params
    params.require(:user).permit(
      :name,
      :nickname,
      :email,
      :password,
      :password_confirmation)
  end
end
