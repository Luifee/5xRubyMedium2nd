class MemosController < ApplicationController

  before_action :authenticate_user!

  def new
    @memo = current_user.memos.new
  end

  def create
    @memo = current_user.memos.new(memo_params)
    if @memo.save
      redirect_to memos_path, notice: '筆記成功發布'
    else
      render :new
    end
  end

  def edit
  end

  def destroy
  end

  private
  def memo_params
    params.require(:memo).permit(:title, :content)
  end

end
