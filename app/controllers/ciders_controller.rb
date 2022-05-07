class CidersController < ApplicationController
  before_action :find_cider, only: %i[edit destroy update show]
  before_action :set_rating, only: %i[index show]

  def index
    @ciders = Cider.all
  end

  def show
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
    reviews = Review.where(cider_id: @cider)
    raise
    # @rating =
  end

  def cider_params
    params.require(:cider).permit(:name, :photo, :region, :flavor, :price, :alcohol_level, :user)
  end
end
