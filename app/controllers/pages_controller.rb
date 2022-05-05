class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: :home

  def profile
    @user = current_user
    @ciders = current_user.ciders
    raise
  end
end
