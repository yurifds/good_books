module CommentsHelper
  def can_delete_comment?(comment)
    if comment.is_a? Comment
      if ((user_signed_in?) && comment.user.id == current_user.id) || can?(:manage, :all)
        true
      else
        false
      end
    end
  end
end
