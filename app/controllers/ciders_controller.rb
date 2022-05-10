class CidersController < ApplicationController
  before_action :find_cider, only: %i[edit destroy update show]
  before_action :set_rating, only: %i[show]

  def index
    if params[:query].present?
      @ciders = Cider.global_search(params[:query])
    else
      @ciders = Cider.all
    end
  end

  def show
    # we only care about active reservations for the view.
    if Reservation.where("active = ? and cider_id = ?", true, @cider.id).exists?
      # find the current user's reservation, if it exists
      @reservation = Reservation.where(["user_id = ? and cider_id = ?", current_user.id, @cider.id])
      if @reservation.exists?
      # if the reservation is active, and the user matches current user, it is reserved by them.
        if @reservation[0].active
          @renter = @reservation[0].user_id === current_user.id ?  true : false
          @reserved = true
        # if the reservation is active but reserved by someone else
        elsif @reservation[0].active == false
          @renter = false
          @reserved = true
        # if the reservation is inactive (this is, someone has already returned it)
        else
          @renter = false
          @reserved = false
        end
      elsif Reservation.where("active = ? and cider_id = ?", true, @cider.id).exists?
        @renter = false
        @reserved = true
      end
    # if no active reservation exists
    else
      @renter = false
      @reserved = false
    end
    # Reservation.where(user_id: current_user.id) &&
    # if Reservation.where(cider_id: @cider.id).exists?
    #  @reserved = true
    # end
    @reviews = Review.where(cider_id: @cider)
  end


  def new
    @cider = Cider.new
  end

  def create
    @cider = Cider.new(cider_params)
    @cider.user_id = current_user.id
    if @cider.valid?
      @cider.save
    # no need for app/views/restaurants/create.html.erb
      redirect_to cider_path(@cider)
    else
      render :new
    end
  end

  def edit; end

  def update
    @cider.update(cider_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    # We need to use Strong Params again to avoid this error, see private
    # method below

    # no need for app/views/restaurants/update.html.erb
    redirect_to cider_path(@cider)
  end

  def destroy
    @cider.destroy
    redirect_to ciders_path
  end

  private

  def find_cider
    @cider = Cider.find(params[:id])
  end

  def set_rating
    unless Review.where(cider_id: @cider) == []
      ratings = Review.where(cider_id: @cider).map{ |review| review.rating}
      @rating = ratings.sum / ratings.count
    else
      @rating = 0
    end
  end

  def cider_params
    params.require(:cider).permit(:name, :photo, :region, :flavor, :price, :alcohol_level, :user)
  end
end
