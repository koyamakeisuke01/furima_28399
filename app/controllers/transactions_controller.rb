class TransactionsController < ApplicationController

  def index
    login_check
    seller_check
    purchased_check
  end

  def create    
    @transaction = ItemTransaction.new(transaction_params)
    if @transaction.valid?      
      pay_item
      @transaction.save
      return redirect_to root_path
    else
      render :index
    end
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

  def purchased_check
    @item = Item.find(params[:item_id])
    @transactions = Transaction.all
    flag = "false"

    @transactions.each do |transaction|
      if @item.id == transaction.item_id
        flag = "true"
        break
      end
    end
    if flag == "true"
      redirect_to root_path
    end
  end

  def transaction_params
    params.permit(:token, :zip_code, :shipping_address_id, :city, :address, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: transaction_params[:token],
      currency:'jpy'
    )
  end

end
