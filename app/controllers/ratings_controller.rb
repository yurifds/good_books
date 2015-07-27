class RatingsController < ApplicationController

  def create
    @rating = book.ratings.where(user_id: current_user.id).first_or_initialize

    if @rating.update(points: params[:points])
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def book
    @book = Book.find(params[:book_id])
  end

end
