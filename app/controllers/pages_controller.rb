class PagesController < ApplicationController
  before_action :set_page, only: [:show]

  def index
  end

  def show
    @comment = @page.comments.build
  end

  private

  def set_page
    if params[:id].blank?
      if Page.where(primary: :true).count != 0
        @page = Page.where(primary: :true).first
      else
        @page = Page.first
      end
    else
      @page = Page.find(params[:id])
    end
  end
end
