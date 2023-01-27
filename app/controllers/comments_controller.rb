class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @memo = Memo.find(params[:memo_id])
    Comment.create(comment_params)
    flash[:notice] = 'コメントを投稿しました'
    redirect_to memo_path(params[:memo_id])
  end

  def destroy
    comment = Comment.find(params[:id])
    @comment = comment.destroy
    flash[:notice] = 'コメントを削除しました'
    redirect_to memo_path(params[:memo_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
          .merge(user_id: current_user.id, memo_id: params[:memo_id])
  end

end