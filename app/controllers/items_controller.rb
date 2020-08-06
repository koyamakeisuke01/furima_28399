class ItemsController < ApplicationController
  def index
  end

  def new
    # 未ログインユーザーはログインページへリダイレクト
    login_check

    
  end

  private
  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
