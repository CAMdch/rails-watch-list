class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @list = List.find(params[:list_id])
    @review.list = @list
    params[:rating1] = 5 if params[:rating1].nil?
    @review.stars = params[:rating1]
    if @review.save
      redirect_to list_path(@list)
    else
      @movies = @list.movies
      @reviews = @list.reviews
      render 'lists/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
