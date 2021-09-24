module PlansHelper
  def format_time(time)
    time ? time.to_time.strftime("%H:%M") : "00:00"
  end
end
