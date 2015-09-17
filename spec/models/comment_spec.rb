require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Relations' do
    it { expect(subject).to belong_to(:user) }
    it { expect(subject).to belong_to(:commentable) }
  end

  context 'Model validations' do
    context 'Presence of' do
      it { expect(subject).to validate_presence_of(:body) }
      it { expect(subject).to validate_presence_of(:user) }
    end
  end
end
