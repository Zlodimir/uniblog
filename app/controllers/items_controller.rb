class ItemsController < ApplicationController
  def index
  	@items = Item.order(:title)
  end

  def show
  	@item = Item.find(params[:id])
  	@items_short = Item.order("created_at ASC").limit(10)
  end
end
