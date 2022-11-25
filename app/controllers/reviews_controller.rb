class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
  
    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurant_path(@restaurant) }
        format.text { render partial: "reviews/review", locals: {review: @review}, formats: [:html] }
        # format.json
      else
        format.html { render "restaurants/show", status: :unprocessable_entity }
        format.text { render partial: "reviews/review", locals: {review:  @review}, formats: [:html] }
        # format.json  # if you want a json response
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
