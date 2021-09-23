class TripPlan < ApplicationRecord
  belongs_to :user
  belongs_to :bus
  belongs_to :orig_stop, class_name: 'Stop'
  belongs_to :dest_stop, class_name: 'Stop'
end
