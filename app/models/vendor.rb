class Vendor < ActiveRecord::Base
  has_many :categories

  default_scope order('sequence ASC')
end
