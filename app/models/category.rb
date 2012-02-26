class Category < ActiveRecord::Base
  belongs_to :vendor
  has_many :items

  default_scope order('sequence ASC')
end
