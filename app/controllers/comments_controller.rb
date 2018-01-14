class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save!

    redirect_to @commentable
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
