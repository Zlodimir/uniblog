class Admin::BaseController < ApplicationController
  before_action :authorize_admin!

  private

  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      redirect_to root_path, alert: 'Вы должны обладать административными полномочиями'
    end
  end
end
