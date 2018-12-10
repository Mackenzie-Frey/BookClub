class AuthorsController < ApplicationController
  def show
    if params[:id]
      @author = Author.find(params[:id])
    else
      redirect books_path
    end
  end
end
