class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  validates :, presence: true, unless: :was_attached?
  belongs_to :category
  belongs_to :delivery
  belongs_to :delivery_time
  belongs_to :prefecture
  belongs_to :state

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 } 
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
  def was_attached?
    self.image.attached?
  end
end
