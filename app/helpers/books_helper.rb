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

  def amount_of_ratings(book)
    if book.is_a? Book
      if book.ratings.count > 1
        "#{book.ratings.count} Avaliações"
      elsif book.ratings.count == 1
        "#{book.ratings.count} Avaliação"
      else
        ""
      end
    end
  end

end
