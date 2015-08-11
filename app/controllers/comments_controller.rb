class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @comment = Comment.build_from( @book, current_user.id, comment_params[:body] )
    @comment.save
    respond_to do |format|
      format.js
    end
  end

  def create_reply
    @root_comment = Comment.find(params[:id])
    @book = Book.find(params[:book_id])
    @new_reply = Comment.build_from(@book, current_user.id, comment_params[:body])
    @new_reply.parent_id = @root_comment.id
    @new_reply.save
    respond_to do |format|
      format.js
    end
  end

  def update
    @book = Book.find(params[:book_id])
    @comment = @book.comment_threads.find(params[:id])
    @comment.update(comment_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.comment_threads.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.js
    end
  end

  def like
    @comment_like = Comment.find(params[:id])
    if current_user.voted_for? @comment_like
      @comment_like.unliked_by current_user
    else
      @comment_like.liked_by current_user
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment)
      .permit(:body, :captcha)
  end
end
