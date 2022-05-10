class ReservationsController < ApplicationController
  def create
    @cider = Cider.find(params[:cider_id])
    # before creating a new reservation, we check to see if an old one exists.
    # if an old reservation by the current user exists, delete it before creating a new one.
    # this if statement is necessary so that we can save the new reservation.
    # OR if an old reservation by another user exists, destroy it so the new reservation can be created.
    if Reservation.where(["user_id = ? and cider_id = ?", current_user.id, @cider.id]).exists? || Reservation.where(["active = ? and cider_id = ? and user_id = ?", false, @cider.id, current_user.id]).exists?
      Reservation.where(["user_id = ? and cider_id = ?", current_user.id, @cider.id])[0].destroy
    end

    @reservation = Reservation.new

    @reservation.cider_id = @cider.id
    @reservation.user_id = current_user.id
    @reservation.date = Date.today
    # active status of reservation necessary for show
    @reservation.active = true
    @reservation.save
    redirect_to cider_path(@cider)
  end

  def edit
    @reservation = Reservation.where(["user_id = ? and cider_id = ?", current_user.id, params[:cider_id]])
    # @reservation = Reservation.where(cider_id: params[:cider_id])
    @reservation[0].active = false
    @reservation[0].save
    redirect_to cider_path
  end
end
