class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                null: false
      t.integer :genre_id,            null: false
      t.text    :text,                null: false
      t.integer :condition_id,        null: false
      t.integer :price,               null: false
      t.integer :payment_id,          null: false
      t.integer :shipping_location_id,null: false
      t.integer :shipping_day_id,     null: false
      t.references :user,             null: false, foreign_key: true

      t.timestamps
    end
  end
end
