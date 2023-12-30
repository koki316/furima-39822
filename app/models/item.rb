class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :pay_for
  belongs_to :prefecture
  belongs_to :ship_day

  belongs_to :user

  has_one_attached :image
  validates :image,   presence: true

  validates :items_name,   presence: true, length: { maximum: 40 }
  validates :description,  presence: true, length: { maximum: 1000 }
  validates :price,        presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { in: 300..9999999 }

  validates :category_id, :condition_id, :pay_for_id, :prefecture_id, :ship_day_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
