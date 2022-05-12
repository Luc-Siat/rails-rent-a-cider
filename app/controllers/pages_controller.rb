class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: :home

  def profile
    set_rating
    @user = current_user
    @ciders = Cider.where(user_id: @user)
    # find all reservations where user_id is user, and active is true
    active_reservations = Reservation.where(["user_id = ? and active = ?", @user, true]).map{ |reservation| reservation.cider_id}
    past_reservations = Reservation.where(["user_id = ? and active = ?", @user, false]).map{ |reservation| reservation.cider_id}

    # find all reservations where user_id is user, and active is false
    # reservations = Reservation.where(user_id: @user).map{ |reservation| reservation.cider_id}
    # @rented_ciders = Cider.where(id: reservations.each { |reservation| reservation })
    @active_rented_ciders = Cider.where(id: active_reservations.each { |reservation| reservation })
    @past_rented_ciders = Cider.where(id: past_reservations.each { |reservation| reservation })
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
