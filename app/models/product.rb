class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

 validates  :image,               presence: true
  validates  :price,               presence: true,
                                   numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates  :name,                presence: true
  validates  :explanation,         presence: true
  validates  :state_id,            numericality: { other_than: 1, message: "を入力して下さい" }
  validates  :category_id,         numericality: { other_than: 1, message: "を入力して下さい" }
  validates  :delivery_id,         numericality: { other_than: 1, message: "を入力して下さい" }
  validates  :prefecture_id,       numericality: { other_than: 1, message: "を入力して下さい" }
  validates  :delivery_time_id,    numericality: { other_than: 1, message: "を入力して下さい" }

  belongs_to :category
  belongs_to :delivery
  belongs_to :delivery_time
  belongs_to :prefecture
  belongs_to :state
  belongs_to :user
  has_one :buy
  has_one_attached :image
end