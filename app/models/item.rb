class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # アソシエーション
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category

  # バリデーション
  validates :image, :name, :description, :category,
  # :status_id,
            # :shipping_charge_id, :shipping_address_id, :shipping_date_id, :price,
              presence: true
  
  validates :category_id, numericality: { other_than: 1, message: "Select" }
end
