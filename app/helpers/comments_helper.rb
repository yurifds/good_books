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

  def amount_of_replys(comment)
    if comment.is_a? Comment
      if comment.children.size > 1
        "#{comment.children.size} #{t('labels.comment.replys')}"
      elsif comment.children.size == 1
        "#{comment.children.size} #{t('labels.comment.reply')}"
      else
        ""
      end
    end
  end
end
