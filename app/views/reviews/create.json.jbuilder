if @review.persisted?
  json.form render(partial: 'reviews/form.html', locals: { restaurant: @restaurant, review: Review.new } )
  json.inserted_item render(partial: 'restaurants/review.html' , locals: { review: @review })
else
  json.form render(partial: 'reviews/form.html', locals: { restaurant: @restaurant, review: @review } )
end
