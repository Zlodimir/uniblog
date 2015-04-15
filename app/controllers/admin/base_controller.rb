class Admin::BaseController < ApplicationController
  before_action :authorize_admin!

  private
  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "Вы должны обладать административными полномочиями"
      redirect_to root_path
    end
  end
end
