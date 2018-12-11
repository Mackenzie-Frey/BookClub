class BooksController < ApplicationController
  def index
    @books = Book.all
    @top_books = Book.books_by_reviews(3, "DESC")
    @lowest_books = Book.books_by_reviews(3, "ASC")
    @power_users = User.users_by_review_count(3)

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
    @book = Book.find(params[:id])
    if @book == nil
      redirect_to books_path
    end
  end

  def new
    @book = Book.new
  end

  def create
    adjusted_params = Author.clean_me_up(book_params)
    @book = Book.create(adjusted_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :pages, :published_year, :authors)
  end
end
