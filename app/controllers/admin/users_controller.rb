class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:destroy]

  def index
    @users = User.order(:lastname)
  end

  def destroy
  	@user.destroy

	flash[:notice] = "Пользователь удален"
	redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
	rescue ActiveRecord::RecordNotFound
	flash[:alert] = "Пользователб не найден"
	redirect_to admin_users_path
  end
end
