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
  validates :price, presence: true, format: { with: /\A[0-9]+\z/},
            numericality: { in: 300..9999999 }

  validates :category_id, :condition_id, :postage_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
