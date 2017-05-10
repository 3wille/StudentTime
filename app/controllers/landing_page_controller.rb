class LandingPageController < ApplicationController
  def index
    if signed_in?
      redirect_to "/dashboard"
    end
  end
end
