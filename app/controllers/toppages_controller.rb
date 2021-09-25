class ToppagesController < ApplicationController
  before_action :sim_time

  def index
    if logged_in?
      @stops = Stop.order(id: :asc)
    else
      redirect_to login_path
    end
  end
end
