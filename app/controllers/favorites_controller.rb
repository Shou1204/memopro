class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(favorite_params)
    @memo = Memo.find(params[:memo_id])
    Favorite.create(favorite_params)
  end

  def destroy
    favorite = Favorite.find_by(memo_id: params[:id], user_id: current_user.id)
    if favorite
      favorite.destroy
    end
  end

  private

  def favorite_params
    params.permit(:memo_id).merge(user_id: current_user.id)
  end

end
