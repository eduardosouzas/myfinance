class HomeController < ApplicationController
  def index
  end

  def home
    redirect_to new_user_session_path
  end
end
