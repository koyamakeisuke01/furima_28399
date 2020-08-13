class ItemsController < ApplicationController

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    # 未ログインユーザーはログインページへリダイレクト
    login_check

    @item = Item.new
  end

  def create  
    @item = Item.new(item_params)
    
    # 必須項目を正常に入力している場合、DBに保存しトップページへ遷移
    if @item.valid?
      @item.save
      redirect_to root_path
    # 未記入の項目がある場合、エラーメッセージを表示
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_charge_id, :shipping_address_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

end
