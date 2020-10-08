class UserOrder
    include ActiveModel::Model
    attr_accessor :token, :user_id, :item_id, :postal_code, :shipping_location_id, :city, :address, :building_name, :phonenumber

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipping_location_id, exclusion: { in: [0] }
    validates :city
    validates :address
    validates :phonenumber, format: { with: /\A\d{11}\z/ }
  end

  def save
    purchase = Purchase.create(
      user_id: user_id,
      item_id: item_id
    )

    Address.create(
      postal_code: postal_code,
      shipping_location_id: shipping_location_id,
      city: city,
      address: address,
      building_name: building_name,
      phonenumber:  phonenumber,
      purchase_id: purchase.id
    )
  end
end
