class Admin::ArticlesController < Admin::BaseController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @attachments = @article.attachments
  end

  def edit
    @attachments = @article.attachments
  end

  def create
    @article = Article.new
    @article.attributes = article_params
    @article.author = current_user

    if @article.save
      flash[:notice] = 'Статья создана'
      redirect_to admin_article_path(@article)
    else
      flash.now[:alert] = 'Статья не создана'
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      # save uploaded files
      if params[:article][:attachments]
        params[:article][:attachments]['attach'].each do |a|
          @attachment = @article.attachments.create!(:attach => a, :article_id => @article.id)
        end
      end

      # delete attached files
      if params[:delete_attachments]
        params[:delete_attachments].each do |id, delete|
          @article.attachments.find(id).destroy! if delete == '1'
        end
      end

      flash[:notice] = 'Статья изменена'
      redirect_to admin_article_path(@article)
    else
      flash.now[:alert] = 'Статья не изменена'
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'Статья удалена'
    redirect_to admin_articles_path
  end

  private
  def set_article
    # Use callbacks to share common setup or constraints between actions.
    @article = Article.find(params[:id])
  end

  def article_params
    # Never trust parameters from the scary internet, only allow the white list through.
    params.require(:article).permit(:title, :text, :bootsy_image_gallery_id)
  end
end
