if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {restaurant: @restaurant, review: Review.new})
  json.inserted_item render(partial: "reviews/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {restaurant: @restaurant, review: @review})
end
