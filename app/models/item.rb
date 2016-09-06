class Item < ActiveRecord::Base
  has_many :line_items
  belongs_to :category
  validates_presence_of :name, :price

  scope :by_price, order("price DESC")
  scope :by_name, order("name ASC, price DESC")
  scope :in_stock, where(:is_stocked => true)
end
