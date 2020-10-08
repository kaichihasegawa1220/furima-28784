FactoryBot.define do
  factory :user_order do
    user_id              { 1 }
    item_id              { 1 }
    token                { '123xxx' }
    postal_code          { '111-2222' }
    shipping_location_id { 1 }
    city                 { '東京市東京区東京町' }
    address              { '東1-1' }
    building_name        { '' }
    phonenumber          { '09011112222'}
  end
end
