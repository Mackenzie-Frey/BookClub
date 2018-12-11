class ReviewsController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    book = Book.find(params[:book_id])
    user = User.find_or_create_by(name: review_params[:user])
    complete_params = review_params
    complete_params[:book_id] = book.id
    complete_params[:user] = user
    review = user.reviews.create(complete_params)
    book.reviews.push(review)
    redirect_to book_path(book)
  end

  private

  def review_params
    params.require(:review).permit(:title, :rating, :description, :user)
  end
  # def user_params
  #   params.require(:user).permit(:name)
  # end

end
