class Admin::PagesController < Admin::BaseController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
  	@pages = Page.order('sort').page params[:page]
  end

  def new
  	@page = Page.new
  end

  def show
  	
  end

  def edit
  	
  end

  def create
  	@page = Page.new
  	@page.attributes = page_param
  	@page.author = current_user

  	if @page.save
  	  redirect_to admin_page_path(@page), notice: 'Страница создана'
  	else
  	  flash.now[:alert] = 'Страница не создана'
  	  render 'new'
  	end
  end

  def update
    #byebug
  	if @page.update(page_param)
  	  redirect_to admin_page_path(@page), notice: 'Страница изменена'
  	else
  	  flash.now[:alert] = 'Страница не изменена'
  	  render 'edit'
  	end
  end

  def destroy
    @page.destroy
	  redirect_to admin_pages_path, notice: 'Страница удалена'
  end

  private
  def set_page
  	@page = Page.find(params[:id])
  end

  def page_param
  	params.require(:page).permit(:name, :content, :bootsy_image_gallery_id, :sort, :primary)
  end
end
