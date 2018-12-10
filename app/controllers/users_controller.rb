class UsersController < ApplicationController

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      redirect users_path
    end
  end

end
