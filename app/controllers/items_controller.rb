class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :login_check, only: [:new, :edit]
  before_action :seller_check, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
    @transactions = Transaction.all
  end

  def new
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
    @transactions = Transaction.all
  end

  def edit
  end

  def update
    # 必須項目を正常に入力している場合、DBを更新トップページへ遷移
    if @item.update(item_params)
      redirect_to root_path
    # 未記入の項目がある場合、エラーメッセージを表示
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def login_check
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def seller_check
    if user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_charge_id, :shipping_address_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
