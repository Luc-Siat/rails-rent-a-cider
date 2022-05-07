class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: :home

  def profile
    @user = current_user
    @ciders = Cider.where(user_id: @user)
    reservations = Reservation.where(user_id: @user).map{ |reservation| reservation.cider_id}
    @rented_ciders = Cider.where(id: reservations.each { |reservation| reservation })
    @reviews = Review.where(user_id: @user)
  end
end
