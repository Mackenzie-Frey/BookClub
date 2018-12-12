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
    title = review_params[:title]
    description = review_params[:description]
    rating = review_params[:rating]
    review_user = User.find_or_create_by(name: review_params[:user].downcase.titlecase)
    Review.create(title: title, description: description, rating: rating, user: review_user, book: book)
    redirect_to book_path(book)
  end

  def destroy
    review = Review.find(params[:id])
    user = review.user
    review.destroy
    redirect_to user_path(user)
  end

  private

  def review_params
    params.require(:review).permit(:title, :rating, :description, :user)
  end

end
