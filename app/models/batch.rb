class Batch < ActiveRecord::Base
  has_many :orders
  belongs_to :pickup

  default_scope order('id DESC')

  scope :after_today, lambda {
    where("deadline IS NULL OR deadline > ?", Time.zone.now).
    order('deadline DESC')
  }

  scope :pickup, lambda { |pickup_id|
    where(:pickup_id => pickup_id)
  }

  # # If a date is entered, make sure it's not in the past
  validates_date :deadline,
                 :on_or_after => :today,
                 :on_or_after_message => "can't be a date in the past",
                 :if => lambda { |b| b.deadline.present? }

  # # Make sure there's only one Batch with an empty date for the pickup
  validates_date :deadline,
                 :allow_blank => false,
                 :invalid_date_message => "cannot be blank. There's already an order batch for this pickup location with a blank deadline.",
                 :if => lambda { |b| b.deadline.blank? && Batch.pickup(b.pickup_id).where("deadline IS NULL").size > 0 }

  validates_presence_of :pickup

  def self.current(pickup_id)
    # Carry forward manager notes from the last batch
    pickup(pickup_id).after_today.last || create!(:pickup_id => pickup_id, :manager_notes => most_recent(pickup_id).try(:manager_notes))
  end

  def self.most_recent(pickup_id)
    pickup(pickup_id).first
  end

end
