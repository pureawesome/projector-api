class Resource < ActiveRecord::Base
  has_many :bookings
  has_many :projects, through: :bookings

  validates :name, presence: true
end
