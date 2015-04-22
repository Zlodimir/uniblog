class CommentsController < ApplicationController
  before_action :set_source

  def create
    if user_signed_in?
      @comment = @source.comments.build(comment_params)
    	@comment.author = current_user

    	if @comment.save
        flash[:notice] = 'Комментарий успешно создан'
        if !params[:item_id].nil?
          redirect_to item_path(@source)
        elsif !params[:page_id].nil?
          redirect_to page_path(@source)
        end
      else
        flash.now[:alert] = 'Комментарий не создан'
        if !params[:item_id].nil?
          render 'items/show'
        elsif !params[:page_id].nil?
          render 'pages/show'
        end
      end
    end
  end

private
  def set_source
    if !params[:item_id].nil?
      @source = Item.find(params[:item_id])
    elsif !params[:page_id].nil?
      @source = Page.find(params[:page_id])
    end
  end
  
  def comment_params
    params.require(:comment).permit(:text)
  end
end
