class CidersController < ApplicationController
  def index
    @ciders = Cider.all
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

  def edit
    find_cider
  end

  def destroy
    find_cider
    @cider.destroy
    redirect_to ciders_path
  end

  def update
    find_cider
    @cider.update(cider_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    # We need to use Strong Params again to avoid this error, see private
    # method below

    # no need for app/views/restaurants/update.html.erb
    redirect_to cider_path(@cider)
  end

  def show
    find_cider
  end

  private

  def find_cider
    @cider = Cider.find(params[:id])
  end

  def cider_params
    params.require(:cider).permit(:name, :photo, :region, :flavor, :alcohol_level, :user)
  end
end
