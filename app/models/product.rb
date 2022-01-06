class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  validates :image,             presence: true, unless: :was_attached?
  validates :name,              presence: true
  validates :explanation,       presence: true
  validates :category,          presence: true
  validates :state,             presence: true
  validates :delivery,          presence: true
  validates :delivery_time,     presence: true
  validates :prefecture,        presence: true
  validates :price,             presence: true

  belongs_to :category
  belongs_to :delivery
  belongs_to :delivery_time
  belongs_to :prefecture
  belongs_to :state

  validates :title, :text, presence: true
  validates :prefecture_id, :category_id, :state_id, :delivery_id, :delivery_time_id, numericality: { other_than: 1 } 
  validates :prefecture_id, :category_id, :state_id, :delivery_id, :delivery_time_id, numericality: { other_than: 1 , message: "can't be blank"}
  def was_attached?
    self.image.attached?
  end
end
