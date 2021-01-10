class BooksController < ApplicationController

  def top
  end

  def index
    @books = Book.all
    @create_book = Book.new
    @user = User.find(current_user.id)
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)
    @create_book = Book.new

  end

  def create
    @create_book = Book.new(book_params)
    @create_book.user_id = current_user.id
    if @create_book.save
      redirect_to book_path(@create_book.id), notice: "You have created book successfully."
    else
      @books = Book.all
      @user = User.find(current_user.id)
      @users = User.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if current_user == @book.user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit
    end
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
