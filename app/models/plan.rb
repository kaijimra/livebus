class Plan < ApplicationRecord
  belongs_to :bus
  belongs_to :stop

  validates :arrv_time, presence: true

#  validates_time :arrv_time
#  validates_time :dept_time
end
