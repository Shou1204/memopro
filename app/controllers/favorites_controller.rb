class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(favorite_params)
    @memo = Memo.find(params[:memo_id])
    Favorite.create(favorite_params)
  end

  def destroy
  end

  private

  def favorite_params
    params.permit(:memo_id).merge(user_id: current_user.id)
  end

end
