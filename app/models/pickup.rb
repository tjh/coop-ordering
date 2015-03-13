class Pickup < ActiveRecord::Base
  scope :active, where(:active => true)

  after_initialize :init

private

  def init
    self.active = true if active.nil?
  end

end
