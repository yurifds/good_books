require 'rails_helper'

RSpec.describe BooksHelper, type: :helper do
  login_user

  describe '#edit_book' do
    let(:current_user) { @user }
    let(:book_current_user) { FactoryGirl.create(:book, user: current_user) }
    let(:user_creator) { FactoryGirl.create(:user) }
    let(:book_other_user) { FactoryGirl.create(:book, user: user_creator) }

    it 'when the book was created by the user' do
      expect(helper.can_edit_book?(book_current_user)).to eql(true)
    end

    it "when the book wasn't created by the user" do
      expect(helper.can_edit_book?(book_other_user)).to eql(false)
    end
  end
end
