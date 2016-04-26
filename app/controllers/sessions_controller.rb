class SessionsController < ApplicationController

  def create
    #raise request.env['omniauth.auth'].to_yaml
    auth = request.env['omniauth.auth']
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    session[:access_token] = auth['credentials']['token']
    
    redirect_to dashboard_path, notice: "Signed In!"
  end

  def destroy
    session[:user_id] = nil
    session[:access_token] = nil
    redirect_to root_url, notice: "Signed Out!"
  end

end