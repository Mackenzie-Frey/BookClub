class AuthorsController < ApplicationController
  def show
    if params[:id]
      @author = Author.find(params[:id])
    else
      redirect books_path
    end
  end

  def destroy
    author = Author.find(params[:id])
    books = author.books
    books.each do |book|
      book.destroy
    end
    author.destroy
    redirect_to books_path
  end
end
