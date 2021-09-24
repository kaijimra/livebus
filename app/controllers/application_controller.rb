class ApplicationController < ActionController::Base
  include SessionsHelper  #追記
  include Pagy::Backend

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def format_time(time)
    time.to_time.strftime("%H:%M") if time
  end
end
