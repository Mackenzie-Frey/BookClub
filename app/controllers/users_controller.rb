class UsersController < ApplicationController

  def show
    it_exists = User.find_by(id: params[:id])
    if it_exists
      @user = User.find(params[:id])
      if params[:sort] == "reviewsdate"
        if params[:order] == "asc"
          @reviews = @user.sort_user_reviews_by_creation_date("ASC")
        elsif params[:order] == "desc"
          @reviews = @user.sort_user_reviews_by_creation_date("DESC")
        end
      else
        @reviews = @user.reviews
      end
    else
      redirect_to books_path
    end
  end

end
