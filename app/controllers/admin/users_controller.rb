class Admin::UsersController < Admin::BaseController
  before_action :set_user!, only: [:destroy]

  def index
    @users = User.order(:lastname)
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'Пользователь удален'
  end

  private

  def set_user!
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to admin_users_path, alert: 'Пользователь не найден'
  end
end
