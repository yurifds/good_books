require 'rails_helper'

RSpec.describe CommentsHelper, type: :helper do
  login_user

  describe '#can_delete_comment?' do
    let(:current_user) { @user }
    let(:user_creator) { FactoryGirl.create(:user) }
    let(:book) { FactoryGirl.create(:book, user: current_user) }
    let(:comment_current_user) { FactoryGirl.create(:comment, commentable_id: book.id, user: current_user) }
    let(:comment_other_user) { FactoryGirl.create(:comment, commentable_id: book.id, user: user_creator) }

    it 'when the comment was created by the user' do
      expect(helper.can_delete_comment?(comment_current_user)).to eql(true)
    end

    it "when the comment wasn't created by the user" do
      expect(helper.can_delete_comment?(comment_other_user)).to eql(false)
    end
  end
end
