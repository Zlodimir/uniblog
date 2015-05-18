class CommentsController < ApplicationController

  def create
    @commentable = find_commentable
    if user_signed_in?
      @comment = @commentable.comments.build(comment_params)
      @comment.author = current_user
      if @comment.save
        flash[:notice] = 'Комментарий успешно создан'
      else
        flash[:alert] = 'Комментарий не создан'
      end
    else
      flash[:alert] = 'Комментарий не создан'
    end
    redirect_to polymorphic_path(@commentable)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
