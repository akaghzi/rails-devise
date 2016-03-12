class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    # if user_signed_in?
      get_access_list
    # end
  end
  def junk
  end
end
