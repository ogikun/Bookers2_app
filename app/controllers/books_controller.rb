class BooksController < ApplicationController

  def top
  end

  def index
    @books = Book.all
    @book = Book.new
    @current_user = User.find(current_user.id)
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(current_user.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to action: :index
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
