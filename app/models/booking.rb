class Booking < ActiveRecord::Base
  belongs_to :project
  belongs_to :resource
end
