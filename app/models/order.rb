class Order < ApplicationRecord
  has_many :ordet_items
  has_many :products, through: :ordet_items
end
