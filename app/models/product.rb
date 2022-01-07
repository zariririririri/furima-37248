class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # has_one :card

  validates  :image,               presence: true
  validates  :price,               numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates  :name,                presence: true
  validates  :state,               presence: true
  validates  :explanation,         presence: true
  validates  :category_id,         numericality: { other_than: 1, message: "can't be blank" }
  validates  :state_id,            numericality: { other_than: 1, message: "can't be blank" }
  validates  :delivery_id,         numericality: { other_than: 1, message: "can't be blank" }
  validates  :prefecture_id,       numericality: { other_than: 1, message: "can't be blank" }
  validates  :delivery_time_id,    numericality: { other_than: 1, message: "can't be blank" }
  belongs_to :category 
  belongs_to :delivery
  belongs_to :delivery_time
  belongs_to :prefecture
  belongs_to :state
  belongs_to :user
  has_one_attached :image
end

  
  
  
  
  # validates :prefecture_id, :category_id, :state_id, :delivery_id, :delivery_time_id, numericality: { other_than: 1 , message: "can't be blank"}
  

