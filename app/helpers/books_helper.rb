module BooksHelper
  def can_edit_book?(book)
    if book.is_a? Book
      if ((user_signed_in?) && book.user.id == current_user.id) || can?(:manage, :all)
        true
      else
        false
      end
    end
  end
end
