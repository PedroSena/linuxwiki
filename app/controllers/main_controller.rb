class MainController < ApplicationController
  def index
  end

  private
  def app_params
    params.require(:user).permit(:provider, :uid, :name, :oauth_token, :oauth_expires_at)
  end
end
