class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurant_path(@restaurant, anchor: "review-#{@review.id}") }
        format.json { render json: success_data }
      else
        format.html { render 'restaurants/show' }
        format.json { render json: unprocessable_data, status: :unprocessable_entity }
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def success_data
    {
      inserted_item: render_to_string(partial: 'restaurants/review.html', locals: { review: @review }),
      form: render_to_string(partial: 'reviews/form.html', locals: { restaurant: @restaurant, review: Review.new })
    }
  end

  def unprocessable_data
    {
      form: render_to_string(partial: 'reviews/form.html', locals: { restaurant: @restaurant, review: @review })
    }
  end
end
