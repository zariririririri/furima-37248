class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string        :name,               null: false
      t.text          :explanation,        null: false
      t.integer       :price,              null: false
      t.references    :user,               null: false, foreign_key: true
      t.integer       :prefecture_id,      null: false
      t.integer       :category_id,        null: false
      t.integer       :state_id,           null: false
      t.integer       :delivery_id,        null: false
      t.integer       :delivery_time_id,   null: false
      t.timestamps
    end
  end
end
