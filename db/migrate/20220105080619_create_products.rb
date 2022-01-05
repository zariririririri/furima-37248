class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name,            null: false
      t.string :explanation,     null: false
      t.string :price,           null: false
      t.string :user,            null: false
      t.string :prefecture,      null: false
      t.string :category,        null: false
      t.string :state,           null: false
      t.string :delivery,        null: false
      t.string :delivery_time,   null: false
      t.timestamps
    end
  end
end
