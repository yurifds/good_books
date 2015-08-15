require 'rails_helper'

RSpec.describe BooksHelper, :type => :helper do

  login_user

  describe '#edit_book' do
    let(:current_user) { @user }
    let(:book_current_user) { FactoryGirl.create(:book, user: current_user) }
    let(:user_creator) { FactoryGirl.create(:user) }
    let(:book_other_user) { FactoryGirl.create(:book, user: user_creator) }

    it "when the book was created by the user" do
      expect(helper.can_edit_book?(book_current_user)).to eql(true)
    end

    it "when the book wasn't created by the user" do
      expect(helper.can_edit_book?(book_other_user)).to eql(false)
    end
  end

  describe '#amount_of_ratings' do
    let(:current_user) { @user }
    let(:book) { FactoryGirl.create(:book, user: current_user) }

    it "when book was classified " do
      FactoryGirl.create(:rating, user: current_user, book: book)
      expect(helper.amount_of_ratings(book)).to eql("1 Avaliação")
    end
    
    it "when book wasn't classified " do
      expect(helper.amount_of_ratings(book)).to be_empty
    end
  end
end
