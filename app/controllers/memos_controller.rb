class MemosController < ApplicationController
  def index
    @memo = Memo.all
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @memo = Memo.find(params[:id])
  end

  private

  def memo_params
    params.require(:memo).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
