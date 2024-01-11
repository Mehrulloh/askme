class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(email: session[:email])
    if user.present?
      session[:user_id] = user.id
      redirect_to root_path, notice: "Вы вошли на сайт"
    else
      render :new, :alert => "Неправильно email или пароль!"
    end
  end
end
