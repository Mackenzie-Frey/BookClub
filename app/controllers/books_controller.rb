class BooksController < ApplicationController
  def index
    @books = Book.all
    @top_books = Book.books_by_reviews(3, "DESC")
    @lowest_books = Book.books_by_reviews(3, "ASC")
    @power_users = User.users_by_review_count(3)
  end

  def show
    if params[:id]
      @book = Book.find(params[:id])
    else
      redirect books_path
    end
  end
end
