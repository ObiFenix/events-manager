class Event < ActiveRecord::Base
  validates :name, :date, :city, :state, presence: true
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :attends, dependent: :destroy
  # has_many :usercomments, through: :comments, dependent: :destroy
end
