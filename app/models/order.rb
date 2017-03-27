class Order < ApplicationRecord
   HASHIDS = Hashids.new(Rails.application.secrets[:secret_key_base] + 'Order', 8, ('A'..'Z').to_a.join)
  has_many :order_items, inverse_of: :order
  has_many :products, through: :order_items

  accepts_nested_attributes_for :order_items,
           allow_destroy: true

  validates :order_items, presence: true

   def auth_token
     @auth_token ||= HASHIDS.encode(rand(10**7)).first(8)
   end
end
