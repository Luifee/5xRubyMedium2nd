class PagesController < ApplicationController
  def index
    @memos = Memo.order(created_at: :desc).includes(:user).take(6)
  end

  def show
    @memo = Memo
  end

  def user
    @user = User
  end
end
