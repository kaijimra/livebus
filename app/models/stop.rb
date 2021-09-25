class Stop < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  has_many :plans, dependent: :destroy
#  has_many :trip_plans
#  has_many :buses, through: :bus_plans, source: :bus
#  has_many :orig_stops, thhrough: :trip_plans, source: :stop
#  has_many :dest_stops, thhrough: :trip_plans, source: :stop

end
