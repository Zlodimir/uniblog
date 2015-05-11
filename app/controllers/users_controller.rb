class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_current_user, only: [:show, :edit, :update]
  
  def show
  end

  def edit
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    @user.attributes = user_params
    @user.avatar = params[:user][:avatar]
    if @user.save(user_params)
      redirect_to user_path(@user), notice: 'Пользователь изменен'
    else
      flash.now[:alert] = 'Пользователь не изменен'
      render 'edit'
    end
  end

  private

  def check_current_user
    if current_user.try(:admin?) == false || current_user.try(:admin?).nil?
      if @user != current_user
        redirect_to root_path, alert: 'Ошибка!'
      end
    end
  end

  def user_params
    params.require(:user).permit(:lastname, :firstname, :email, :password, :admin, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Пользователь не найден'
  end
end
