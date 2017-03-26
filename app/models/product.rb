class Product < ApplicationRecord
  has_many :order_items, inverse_of: :product
  has_many :orders, through: :order_items

  has_attached_file :image, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
