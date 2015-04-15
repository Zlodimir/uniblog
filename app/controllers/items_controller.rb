class ItemsController < ApplicationController
  def index
  	@items = Item.order(:title)
  end

  def show
  	@item = Item.find(params[:id])
  end
end
