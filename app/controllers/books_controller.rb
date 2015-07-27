class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @points_current_user = @book.ratings.where(user_id: current_user.id).first.points
    @comment = Comment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path, notice: 'Book edited successfully'
    else
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: 'Book registered successfully'
    else
      render 'books/index'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book)
      .permit(:title, :author, :category_id, :amazon_id, :description, :image_book)
  end
end
