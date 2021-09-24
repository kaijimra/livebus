class Bus < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  has_many :plans, dependent: :destroy
#  has_many :stops, through: :bus_plans, source: :stop
#  has_many :orig_stops, thhrough: :trip_plans, source: :stop
#  has_many :dest_stops, thhrough: :trip_plans, source: :stop
#  has_many :users, through: :trip_plans, source: :user

end
