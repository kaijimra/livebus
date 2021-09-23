class Plan < ApplicationRecord
  belongs_to :bus
  belongs_to :stop
end
