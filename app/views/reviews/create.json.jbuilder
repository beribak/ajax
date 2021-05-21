if @review.persisted?
  json.form do
    json.partial! 'reviews/form.html', restaurant: @restaurant, review: Review.new
  end
  json.form do
    json.partial! 'restaurants/review.html', review: @review
  end
else
  json.form do
    json.partial! 'reviews/form.html', restaurant: @restaurant, review: @review
  end
end
