class ReviewsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:restaurant_id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    review = review_params
    restaurant_id = Restaurant.find(params[:restaurant_id])
    review[:id] = params[:id]

    @review = Review.create(review)
    if @review.save
      flash[:notice] = "Review added"
      redirect_to restaurant_reviews_path(restaurant_id)
    else
      flash[:notice] = "Invalid entry"
      redirect_to :back
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.find(params[:id])
  end

  protected
  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
