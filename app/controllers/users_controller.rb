class UsersController < ApplicationController
  
  def index
    @users = User.all
    @current_user = User.find(current_user.id)
    @books = Book.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
  end
  
  def create
  end
  
end