class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_current_user, only: [:show, :edit, :update]
  
  def show

  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    if @user.update(user_params)
      flash[:notice] = "Пользователь изменен"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Пользователь не изменен"
      render "edit"
    end
  end

  private

  def check_current_user
  	if current_user.admin == false
  		if @user != current_user
  			flash[:alert] = "Ошибка!"
  			redirect_to root_path
  		end
  	end
  end

  def user_params
	params.require(:user).permit(:lastname, :firstname, :email, :password, :admin)
  end

  def set_user
    @user = User.find(params[:id])
	rescue ActiveRecord::RecordNotFound
	flash[:alert] = "Пользователь не найден"
	redirect_to admin_users_path
  end
end
