class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :set_pages
  before_action :set_last_news
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index

  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :firstname
    devise_parameter_sanitizer.for(:sign_up) << :lastname
    devise_parameter_sanitizer.for(:account_update) << :firstname
    devise_parameter_sanitizer.for(:account_update) << :lastname
  end

  def set_pages
    @pages = Page.order('sort').all
    if Page.where(primary: :true).count != 0
      @main_page = Page.where(primary: :true).first
    else
      @main_page = Page.first
    end
  end

  def set_last_news
    @latest_items = Item.latest_items
  end

end
