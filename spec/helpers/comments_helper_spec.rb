require 'rails_helper'

RSpec.describe CommentsHelper, :type => :helper do

  login_user

  describe '#can_delete_comment?' do
    let(:current_user) { @user }
    let(:user_creator) { FactoryGirl.create(:user) }
    let(:book) { FactoryGirl.create(:book, user: current_user) }
    let(:comment_current_user) { FactoryGirl.create(:comment, commentable_id: book.id, user: current_user) }
    let(:comment_other_user) { FactoryGirl.create(:comment, commentable_id: book.id, user: user_creator) }


    it "when the comment was created by the user" do
      expect(helper.can_delete_comment?(comment_current_user)).to eql(true)
    end

    it "when the comment wasn't created by the user" do
      expect(helper.can_delete_comment?(comment_other_user)).to eql(false)
    end
  end

  describe '#amount_of_replys' do
    let(:current_user) { @user }
    let(:book) { FactoryGirl.create(:book, user: current_user) }
    let(:root_comment) { FactoryGirl.create(:comment, commentable_id: book.id, user: current_user) }

    it "when comment has replied" do
      FactoryGirl.create(:comment,parent_id: root_comment.id, commentable_id: book.id, user: current_user)
      expect(helper.amount_of_replys(root_comment)).to eql("1 Resposta")
    end

    it "when comment hasn't replied" do
      expect(helper.amount_of_replys(root_comment)).to be_empty
    end
  end
end
