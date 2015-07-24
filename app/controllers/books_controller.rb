class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    #code
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
      .permit(:title, :author, :category_id, :amazon_id, :description)
  end
end
