class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @memo = user.memos.includes(:user).order("created_at DESC")
  end
end
