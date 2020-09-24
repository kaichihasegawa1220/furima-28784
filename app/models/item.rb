class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :item_purchase
  has_one_attached :image

  belongs_to_active_hash :genre
  belongs_to_active_hash :condition
  belongs_to_active_hash :payment
  belongs_to_active_hash :shipping_location
  belongs_to_active_hash :shipping_day

  validates_inclusion_of :price, in: 300..9_999_999, message: 'out of setting range'
  validates_presence_of :price, message: "can't be blank"

  validates :image, :name, :text, :genre_id, :condition_id, :payment_id, :shipping_location_id, :shipping_day_id, presence: true
  validates :genre_id, numericality: { other_than: 0 } 
  validates :condition_id, numericality: { other_than: 0 } 
  validates :payment_id, numericality: { other_than: 0 } 
  validates :shipping_location_id, numericality: { other_than: 0 } 
  validates :shipping_day_id, numericality: { other_than: 0 } 

end
