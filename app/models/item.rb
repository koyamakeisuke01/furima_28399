class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # アソシエーション
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_address
  belongs_to_active_hash :shipping_date
  has_one :destination

  # バリデーション
  with_options presence: true do
    validates :image,
              :name,
              :description,
              :category,
              :status,
              :shipping_charge,
              :shipping_address,
              :shipping_date
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
  end

  with_options numericality: { other_than: 1, message: "Select" } do
    validates :category_id,
              :status_id,
              :shipping_charge_id,
              :shipping_address_id,
              :shipping_date_id
  end
end
