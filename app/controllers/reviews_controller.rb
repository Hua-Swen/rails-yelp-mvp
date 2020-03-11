class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id].to_i)
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @restaurant = Restaurant.find(params[:restaurant_id].to_i)
    @review.restaurant = @restaurant
    if @review.save
      respond_to  do |format|
        format.html { redirect_to restaurant_path(@restaurant) }
      end
    else
      render :new
    end
  end

  private
  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
