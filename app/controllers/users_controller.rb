class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :nickname, :email)

    @user = User.new(user_params)

    if @user.save
     redirect_to root_path, notice: 'Вас зареєстровано!'
    else
     # flash[:notice] = @user.errors.full_messages
      #flash[:alert] = 'Шось Ви неправелно ввели'
      render :new
    end

  end
end
