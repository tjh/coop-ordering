class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :batch
  has_many :line_items, :dependent => :destroy

  accepts_nested_attributes_for :line_items, :reject_if => proc { |a| a['quantity'].blank? || a['quantity'] == 0 }

  validates_presence_of :batch
  validate :has_at_least_one_line_item

  default_scope includes(:line_items)

  scope :recent_first, order("created_at DESC")

  scope :by_user_name, joins(:user).
                       order('users.last_name, users.first_name')

  attr_accessor :is_preview

  def is_preview
    @is_preview == 'true' || @is_preview == true ? true : false
  end

  def is_preview?
    is_preview
  end

  def has_at_least_one_line_item
    errors.add :quantity, 'Please enter a quantity for at least one item' if line_items.size == 0
  end
end
