class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @memo = Memo.find(params[:memo_id])
    Comment.create(comment_params)
    redirect_to memo_path(params[:memo_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
          .merge(user_id: current_user.id, memo_id: params[:memo_id])
  end
end
