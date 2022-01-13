class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.integer :user_id,      null: false
      t.integer :product_id,   null: false
      
      t.timestamps
    end
  end
end
