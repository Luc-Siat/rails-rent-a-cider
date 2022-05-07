class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: :home

  def profile
    @user = current_user
    @ciders = Cider.where(user_id: @user)
    @rented_ciders = Reservation.where(user_id: @user)
  end
end
