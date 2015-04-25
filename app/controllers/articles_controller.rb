class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @attachments = @article.attachments
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @attachments = @article.attachments
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save

        # save uploaded file
        params[:article][:attachments]['attach'].each do |a|
          @attachment = @article.attachments.create!(:attach => a, :article_id => @article.id)
        end

        format.html { redirect_to @article, notice: 'Новая публикация успешно создана.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
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
            if delete=='1'
              @article.attachments.find(id).destroy!
            end
          end
        end

        format.html { redirect_to @article, notice: 'Публикация обновлена.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_attachment
    attachment = Attachment.find(params[:id])
    filename = attachment.attach.to_s
    send_file 'public' + filename
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Публикация удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
