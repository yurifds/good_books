class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = Comment.build_from( @book, current_user.id, comment_params[:body] )
    @comment.save
    redirect_to book_path(@book)
  end

  def comment_params
    params.require(:comment)
      .permit(:body)
  end
end
