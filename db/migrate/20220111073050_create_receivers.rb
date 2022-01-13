class CreateReceivers < ActiveRecord::Migration[6.0]
  def change
    create_table :receivers do |t|
      t.integer       :post_code,            null: false
      t.integer       :telephone_number,     null: false
      t.integer       :city,                 null: false
      t.integer       :house_number,         null: false
      t.integer       :prefecture_id,        null: false
      t.integer       :building
      t.references    :buy,                  null: false, foreign_key: true

      t.timestamps
    end
  end
end