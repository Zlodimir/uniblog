class ItemsController < ApplicationController
  def index
  	#@items = Item.order("created_at DESC")
  	#byebug
  	@items = Item.order('created_at desc').page params[:page]
  end

  def show
  	@item = Item.find(params[:id])
  	@comment = @item.comments.build
  end
end
