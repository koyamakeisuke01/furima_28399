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

  # バリデーション
  validates :image,
            :name,
            :description,
            :category,
            :status,
            :shipping_charge,
            :shipping_address,
            :shipping_date, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
  
  validates :category_id,         numericality: { other_than: 1, message: "Select" }
  validates :status_id,           numericality: { other_than: 1, message: "Select" }
  validates :shipping_charge_id,  numericality: { other_than: 1, message: "Select" }
  validates :shipping_address_id, numericality: { other_than: 1, message: "Select" }
  validates :shipping_date_id,    numericality: { other_than: 1, message: "Select" }
end
