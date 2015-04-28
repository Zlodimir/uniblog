class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all #.order('sort') params[:article]
  end

  def new
    @article = Article.new
  end

  def show

  end

  def edit

  end

  def create
    @article = Article.new
    @article.attributes = article_param
    #@page.author = current_user

    if @article.save
      flash[:notice] = 'Статья создана'
      redirect_to admin_article_path(@article)
    else
      flash.now[:alert] = 'Статья не создана'
      render 'new'
    end
  end

  def update
    #byebug
    if @article.update(article_param)
      flash[:notice] = 'Статья изменена'
      redirect_to admin_article_path(@article)
    else
      flash.now[:alert] = 'Статья не изменена'
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Статья удалена"
    redirect_to admin_articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_param
    params.require(:article).permit(:title, :text, :bootsy_image_gallery_id)
  end
end
