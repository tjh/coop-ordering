class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  belongs_to :vendor

  before_save :denormalize_attributes

  validates_presence_of :item
  validates_numericality_of :quantity, :greater_than => 0, :only_integer => true

  delegate :notes,
           :to => :item

  def denormalize_attributes
    return if !item
    self.name        = item.name
    self.price       = item.price
    self.uom         = item.uom
    self.vendor      = item.category.vendor
    self.sold_per    = item.sold_per
    self.is_stocked  = item.is_stocked
    self.is_limited  = item.is_limited
    self.vendor_name = vendor.name
  end

  def price
    read_attribute(:price) || item.price
  end

  def uom
    read_attribute(:uom) || item.uom
  end

  def sold_per
    read_attribute(:sold_per) || item.sold_per
  end

  def is_stocked
    read_attribute(:is_stocked) || item.is_stocked
  end

  def is_limited
    read_attribute(:is_limited) || item.is_limited
  end

  def name
    read_attribute(:name) || item.name
  end

  def vendor_id
    read_attribute(:vendor_id) || item.vendor_id
  end

  def vendor_name
    read_attribute(:vendor_name) || item.category.vendor.name
  end
end
