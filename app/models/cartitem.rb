class Cartitem < ApplicationRecord
  belongs_to :article
  belongs_to :cart

  validates :quantity_ordered, numericality: { greater_than: 0 }, on: :create
  validates :quantity_ordered, numericality: { greater_than_or_equal_to: 0 }, on: :update

  attr_reader :q_order, :q_new

end
