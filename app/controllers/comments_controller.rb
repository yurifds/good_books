class CommentsController < ApplicationController

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

  def like
    comment = Comment.find(params[:id])
    if current_user.voted_for? comment
      comment.unliked_by current_user
    else
      comment.liked_by current_user
    end
    redirect_to root_path
  end

  def comment_params
    params.require(:comment)
      .permit(:body, :commentable_id, :commentable_type)
  end
end
