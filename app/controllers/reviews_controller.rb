class ReviewsController < ApplicationController
  def new
    # we need @cider in our `simple_form_for`
    @cider = Cider.find(params[:cider_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    # we need `cider_id` to associate review with corresponding cider
    @cider = Cider.find(params[:cider_id])
    @review.cider_id = @cider.id
    @review.user_id = current_user.id
    if @review.save
      redirect_to cider_path(@cider)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
