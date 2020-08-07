class Item < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  has_one_attached :image

  # バリデーション
  validates :image, :name, :description, 
  # :category_id, :status_id,
            # :shipping_charge_id, :shipping_address_id, :shipping_date_id, :price,
              presence: true
  
end
