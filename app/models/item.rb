class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user

  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :text, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { only_integer: true, message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  validates :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
