class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
    @attachments = @article.attachments
  end

  def get_attachment
    attachment = Attachment.find(params[:id])
    filename = attachment.attach.to_s
    send_file 'public' + URI.unescape(filename)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

end
