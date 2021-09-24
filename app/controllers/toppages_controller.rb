class ToppagesController < ApplicationController
  def index
    if logged_in?
      @simtime = format_time(Time.at(Time.now.to_i*600))
      @pagy, @stops = pagy(Stop.order(id: :asc))
    else
      redirect_to login_path
    end
  end
end
