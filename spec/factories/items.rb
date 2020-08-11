FactoryBot.define do
  factory :item do
    name                    {"自転車"}
    description             {"未使用のクロスバイクです"}
    price                   {"300"}
    association             :user
    category
    status
    shipping_charge
    shipping_address
    shipping_date
  end
end