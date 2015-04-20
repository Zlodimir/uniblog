class CommentsController < ApplicationController
  before_action :set_item

  def create
    if user_signed_in?
      @comment = @item.comments.build(comment_params)
    	@comment.author = current_user

    	if @comment.save
        flash[:notice] = 'Комментарий успешно создан'
        redirect_to item_path(@item)
      else
        flash.now[:alert] = 'Комментарий не создан'
        render 'items/show'
      end
    else
        flash[:alert] = 'Комментарий не создан'
        redirect_to item_path(@item)
    end
  end

private
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def comment_params
    params.require(:comment).permit(:text)
  end
end
