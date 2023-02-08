class MemosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_memo, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit]

  def index
    @memo = Memo.all.includes(:user).order("created_at DESC")
  end

  def new
    @memo_form = MemoForm.new
  end

  def create
    @memo_form = MemoForm.new(memo_form_params)
    if @memo_form.valid?
      @memo_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @memo.comments
  end

  def edit
    memo_attributes = @memo.attributes
    @memo_form = MemoForm.new(memo_attributes)
  end

  def update
    @memo_form = MemoForm.new(memo_form_params_up)
    if @memo_form.valid?
      @memo_form.update(memo_form_params_up, @memo)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @memo.destroy
      redirect_to root_path
    end
  end


  private

  def set_memo
    @memo = Memo.find(params[:id])
  end

  def memo_form_params
    params.require(:memo_form).permit(:title, :text, :image, :tag_name).merge(user_id: current_user.id)
  end

  # タグの保存ができないので一時的な記述
  def memo_form_params_up
    params.require(:memo_form).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user == @memo.user
      redirect_to root_path
    end
  end
  
end
