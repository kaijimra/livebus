module PlansHelper
  def format_time(time)
    time ? (l time.to_time) : "00:00"
  end

  def f_HHMM?(time)
    time =~ /\A([0-9]|[0-1][0-9]|[2][0-3]):[0-5][0-9]\z/
  end

  def sim_time
    @simtime = format_time(Time.at(Time.now.to_i*1+9*60*60))
  end
end
