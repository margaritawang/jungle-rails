class ReviewsController < ApplicationController
  before_filter :check_login
  
  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user_id = session[:user_id]
    if @review.save
      p @review
      redirect_to :back

    end
  end

  def remove_review
    Review.find(params[:review_id]).destroy
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :product_id
    )
  end
end
