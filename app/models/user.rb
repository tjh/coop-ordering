class User < ActiveRecord::Base
  has_many :orders
  belongs_to :pickup

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  before_create :make_all_users_a_member

  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :first_name,
                  :last_name,
                  :is_member,
                  :daytime_phone,
                  :evening_phone,
                  :address1,
                  :address2,
                  :city,
                  :state,
                  :zip,
                  :pickup_id

  scope :by_name, order("last_name ASC, first_name ASC")

  validates_presence_of :first_name, :last_name, :daytime_phone, :evening_phone, :address1, :city, :zip

  validates_length_of :state, :is => 2, :message => 'abbreviation must be 2 letters'
  validates_presence_of :pickup_id, :message => 'location must be selected'

  def full_name
    "#{first_name} #{last_name}"
  end

  # Temporary...so that beta users don't have to wait
  # before ordering
  def make_all_users_a_member
    self.is_member = true
  end
end
