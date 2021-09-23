class Bus < ApplicationRecord
  has_many :bus_plans
  has_many :trip_plans
  has_many :stops, thryough: :bus_plans, source: :stop
end
