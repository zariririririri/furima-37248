class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string    :name,               null: false
      t.string    :explanation,        null: false
      t.string    :price,              null: false
      t.string    :user,               null: false
      t.integer   :prefecture_id,      null: false
      t.integer   :category_id,        null: false
      t.integer   :state_id,           null: false
      t.integer   :delivery_id,        null: false
      t.integer   :delivery_time_id,   null: false
      t.timestamps
    end
  end
end
