require 'rails_helper'

RSpec.describe User do

  context "Relations" do
    it { expect(subject).to have_many(:ratings) }
    it { expect(subject).to have_many(:books) }
  end

  context "Model validations" do
    context "Presence of" do
      it { expect(subject).to validate_presence_of(:name) }
      it { expect(subject).to validate_presence_of(:last_name) }
    end
  end

  describe "#rating_by_user " do
    let(:current_user) { FactoryGirl.create(:user_test) }
    let(:book) { FactoryGirl.create(:book, user: current_user) }

    it "when user classified the book" do
      FactoryGirl.create(:rating, user: current_user, book: book)
      expect(current_user.rating_by_user(book)).to eql(3)
    end

    it "when the user doesn't classify the book" do
      expect(current_user.rating_by_user(book)).to eql(0)
    end
  end
end
