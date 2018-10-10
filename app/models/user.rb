class User < ActiveRecord::Base
  validates :first_name, :last_name, :city, presence: true
  validates :state, presence: true, length: {is: 2}

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  
  has_secure_password

  # validates :password, length: {minimum: 8}, if: :new_record?
  # validates :password_confirmation, presence: true

  has_many :comments
  has_many :events, dependent: :destroy
  has_many :events_attended, through: :attends, source: :event, dependent: :destroy
  has_many :events_commended, through: :comments, source: :event, dependent: :destroy
  
end
