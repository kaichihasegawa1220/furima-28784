FactoryBot.define do
  factory :item do

    name {'test'}
    genre_id {2}
    text {'新品'}
    condition_id {2}
    price {300}
    payment_id {2}
    shipping_location_id {2}
    shipping_day_id {2}

    association :user
  end
end