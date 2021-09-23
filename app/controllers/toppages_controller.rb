class ToppagesController < ApplicationController
  def index
    if logged_in?
      @pagy, @stops = pagy(Stop.order(id: :desc))
    else
      redirect_to login_path
    end
  end
end
