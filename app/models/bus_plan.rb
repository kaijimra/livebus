class BusPlan < ApplicationRecord
  belongs_to :bus
  belongs_to :stop
end
