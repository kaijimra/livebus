class Plan < ApplicationRecord
  belongs_to :bus
  belongs_to :stop

#  validates :arrv_time,
#    format: { with: /\A([0-9]|[0-1][0-9]|[2][0-3]):[0-5][0-9]\z/ }
#  validates :dept_time,
#    format: { with: /\A([0-9]|[0-1][0-9]|[2][0-3]):[0-5][0-9]\z/ }
#  validates_time :arrv_time
#  validates_time :dept_time
end
