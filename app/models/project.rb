class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy # if you destroy project it'll destroy tasks
  has_many :bookings, dependent: :destroy
  has_many :resources, through: :bookings

  validates :name, presence: true
end
