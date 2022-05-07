class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: :home

  def profile
    set_rating
    @user = current_user
    @ciders = Cider.where(user_id: @user)
    reservations = Reservation.where(user_id: @user).map{ |reservation| reservation.cider_id}
    @rented_ciders = Cider.where(id: reservations.each { |reservation| reservation })
  end

  def set_rating
    unless Review.where(cider_id: @cider) == []
      ratings = Review.where(cider_id: @cider).map{ |review| review.rating}
      @rating = ratings.sum / ratings.count
    else
      @rating = 0
    end
  end
end
