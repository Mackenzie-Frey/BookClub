class BooksController < ApplicationController
  def index
    @books = Book.all
    @top_books = Book.books_by_reviews(3, "DESC")
    @lowest_books = Book.books_by_reviews(3, "ASC")
    @power_users = User.users_by_review_count(3)
    # if params[:sort] == "pages"
    #   feohwaifheiwo
    # elsif params[:sort] == "ratings"
    #   faiofpjewiaopfjewioa
    if params[:sort] == "reviews"
      if params[:order] == "asc"
        @books = Book.sort("reviews", "ASC")
      elsif params[:order] == "desc"
        @books = Book.sort("reviews", "DESC")
      end
    elsif params[:sort] == "ratings"
      if params[:order] == "asc"
        @books = Book.sort("ratings", "ASC")
      elsif params[:order] == "desc"
        @books = Book.sort("ratings", "DESC")
      end
    elsif params[:sort] == "pages"
      if params[:order] == "asc"
        @books = Book.sort("pages", "ASC")
      elsif params[:order] == "desc"
        @books = Book.sort("pages", "DESC")
      end
    end
  end

  def show
    if params[:id]
      @book = Book.find(params[:id])
    else
      redirect books_path
    end
  end
end
