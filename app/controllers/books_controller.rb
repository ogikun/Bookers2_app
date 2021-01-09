class BooksController < ApplicationController

  def top
  end

  def index
    @books = Book.all
    @create_book = Book.new
    @current_user = User.find(current_user.id)
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @current_user = User.find(current_user.id)
    @create_book = Book.new
  end

  def create
    @create_book = Book.new(book_params)
    @create_book.user_id = current_user.id
    @create_book.save
    redirect_to book_path(@create_book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
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
