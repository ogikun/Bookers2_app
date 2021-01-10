class UsersController < ApplicationController

  def index
    @users = User.all
    @create_book = Book.new
    @c_user = User.find(current_user.id)
    @books = Book.all
  end

  def show
    @c_user = User.find(params[:id])
    @create_book = Book.new
    @books = @c_user.books
  end

  def edit
    @user = User.find(params[:id])
    if current_user == @user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
      
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end