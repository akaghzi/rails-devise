class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
      get_access_list
  end
  def junk
  end
end
