FactoryBot.define do
  factory :item do
    name                    {"自転車"}
    description             {"未使用のクロスバイクです"}
    price                   {"300"}
    association             :user
    category_id             {2}
    status_id               {2}
    shipping_charge_id      {2}
    shipping_address_id     {2}
    shipping_date_id        {2}
  end
end