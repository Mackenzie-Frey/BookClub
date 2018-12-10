class UsersController < ApplicationController

  def show
    it_exists = User.find_by(id: params[:id])
    if it_exists
      @user = User.find(params[:id])
    else
      redirect_to books_path
    end
  end

end
