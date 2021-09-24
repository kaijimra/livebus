class Plan < ApplicationRecord
  belongs_to :bus
  belongs_to :stop

#  validates_time :arrv_time
#  validates_time :dept_time
end
