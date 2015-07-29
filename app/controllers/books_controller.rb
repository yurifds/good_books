class BooksController < ApplicationController
  #load_and_authorize_resource :only => [:index, :edit, :update, :create, :destroy]
  load_and_authorize_resource

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])

    if user_signed_in?
      rating = current_user.ratings.where(user_id: current_user.id, book_id: @book.id).first

      if rating
        @points_current_user = rating.points
      end
    end

    #@points_current_user = @book.ratings.where(user_id: current_user.id).first.points
    @comment = Comment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to root_path, notice: 'Book edited successfully'
    else
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path, notice: 'Book registered successfully'
    else
      render 'books/new'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path
  end


  private

  def book_params
    params.require(:book)
      .permit(:title, :author, :category_id, :description, :image_book)
  end
end
