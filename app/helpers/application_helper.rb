module ApplicationHelper
  include Pagy::Frontend


  def format_time(time)
    time.to_time.strftime("%H:%M") if time
  end

end
