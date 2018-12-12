class AuthorsController < ApplicationController
  def show
    it_exists = Author.find_by(id: params[:id])
    if it_exists
      @author = Author.find(params[:id])
    else
      redirect_to books_path
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
