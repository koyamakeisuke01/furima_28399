class TransactionsController < ApplicationController

  def index
    login_check
    seller_check
  end

  private
  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def seller_check
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
