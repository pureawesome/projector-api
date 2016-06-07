class Resource < ActiveRecord::Base
  has_many :bookings, dependent: :destroy
  has_many :projects, through: :bookings

  validates :name, presence: true
end
