class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    restaurant = restaurant_params

    @restaurant = Restaurant.create(restaurant)
    if @restaurant.save
      flash[:notice] = "Restaurant added"
      redirect_to restaurant_path(@restaurant)
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
  def restaurant_params
    params.require(:restaurant).permit(:name, :city, :state, :zip)
  end

end
