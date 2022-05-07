class ReservationsController < ApplicationController
  def create
    # TODO: if reservation for the cider already exists, don't allow someone else to make a reservation.
    # Reservation.where (see if a the cider_id is already in the Reservation table, then don't let the reservation happen.)
    @reservation = Reservation.new
    # we need `cider_id` to associate reservation with corresponding cider
    @cider = Cider.find(params[:cider_id])
    @reservation.cider_id = @cider.id
    @reservation.user_id = current_user.id
    @reservation.date = Date.today
    @reservation.active = true
    if @reservation.save
      redirect_to cider_path(@cider)
    else
      render html: "<script>alert('Already reserved!')</script>".html_safe
    end
  end

  def edit
    @reservation = Reservation.find(params[:cider_id])
    @reservation.active = false
    redirect_to cider_path
  end
end
