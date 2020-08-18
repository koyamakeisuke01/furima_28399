class ItemTransaction

  include ActiveModel::Model
  attr_accessor :token, :zip_code, :shipping_address_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :price

  VALID_ZIPCODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
  VALID_PHONENUMBER_REGEX = /\A\d{10}$|^\d{11}\z/

  with_options presence: true do
    validates :shipping_address_id,
              :city,
              :address
    validates :zip_code, format: { with: VALID_ZIPCODE_REGEX, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, format: { with: VALID_PHONENUMBER_REGEX, uniqueness: true }              
  end
  with_options numericality: { other_than: 1, message: "Select" } do
    validates :shipping_address_id
  end

  def save
    Destination.create(zip_code: zip_code, shipping_address_id: shipping_address_id, city: city, address: address, building_name: building_name, phone_number: phone_number, item_id: item_id)
    Transaction.create(item_id: item_id, user_id: user_id)
  end

end