class Admin::ItemsController < Admin::BaseController
	before_action :set_item, only: [:show, :edit, :update, :destroy]

  	def index
  		@items = Item.order('created_at desc').page params[:page]
  	end

  	def show

  	end

	def new
		@item = Item.new
	end

	def edit
	end

	def update
		if @item.update(item_params)
			flash[:notice] = "Новость изменена"
			redirect_to admin_item_path(@item)
		else
			flash.now[:alert] = "Новость не изменена"
			render "edit"
		end
	end

	def create
		@item = Item.new
		@item.attributes = item_params
		@item.author = current_user

		if @item.save
			flash[:notice] = 'Новость создана'
			redirect_to admin_item_path(@item)
		else
			flash.now[:alert] ='Новость не создана'
			render "new"
		end
	end

	def destroy
		@item.destroy
		flash[:notice] = "Новость удалена"
		redirect_to admin_items_path
	end

	private
	def set_item
		@item = Item.find(params[:id])
	end

	def item_params
		params.require(:item).permit(:title, :description, :bootsy_image_gallery_id)
	end
end
