class OrderItem < ApplicationRecord
  belongs_to :order, inverse_of: :order_items
  belongs_to :product

  accepts_nested_attributes_for :product

  validates :count, presence: true, numericality: {only_integer: true, greater_than: 0}
  validate :check_quantity

  after_validation :change_count

  private

  def check_quantity
    errors.add(:count, "No such quantity of product in stock") if
      (unless coming
        Product.find_by('id = ?', product_id).count < count
      end)
  end

  def change_count
    product = Product.find_by('id = ?', product_id)
    if coming
      product.count = product.count + count
    else
      product.count = product.count - count
    end
    begin
      product.save
    rescue ActiveRecord::StaleObjectError
      change_count
    end
  end
end
