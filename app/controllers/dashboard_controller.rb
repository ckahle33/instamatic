class DashboardController < ApplicationController
  def index
    client = Instagram.client(:access_token => session[:access_token])
    @media = client.user_recent_media
  end

end