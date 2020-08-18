FactoryBot.define do
  factory :item_transaction do
    zip_code            {"123-4567"}
    shipping_address_id {2}
    city                {"東京都"}
    address             {"1-1"}
    building_name       {"東京ハイツ"}
    phone_number        {"09012341234"}
  end
end
