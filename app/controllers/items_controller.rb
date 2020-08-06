class ItemsController < ApplicationController

  def new
    # 未ログインユーザーはログインページへリダイレクト
    login_check

    @item = Item.new
  end

  def create
  end

  private
  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
