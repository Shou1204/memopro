class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @memo = user.memos
  end
end
