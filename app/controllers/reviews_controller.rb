class ReviewsController < ApplicationController
  before_action :authenticate_user! #devise method
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant


  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.restaurant_id = @restaurant.id

    if @review.save
      format.html { redirect_to @restaurant, notice: 'Review was successfully created.' }
    else
      format.html { render :new }
    end
  end

  def update
    if @review.update(review_params)
      format.html { redirect_to @review, notice: 'Review was successfully updated.' }
    else
      format.html { render :edit }
    end
  end

  def destroy
    @review.destroy
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end

end
