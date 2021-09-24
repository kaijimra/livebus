module BusesHelper
def newestbus
  Bus.order(updated_at: :desc).limit(1)
end

# helper_method :newestbus

end
