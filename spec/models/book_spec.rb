require 'rails_helper'

RSpec.describe Book do
  context 'Relations' do
    it { expect(subject).to have_many(:ratings) }
  end

  context 'Model validations' do
    context 'Presence of' do
      it { expect(subject).to validate_presence_of(:title) }
      it { expect(subject).to validate_presence_of(:author) }
      it { expect(subject).to validate_presence_of(:ISBN) }
      it { expect(subject).to validate_presence_of(:language) }
      it { expect(subject).to have_attached_file(:image_book) }
      it { expect(subject).to validate_presence_of(:description) }
    end
  end
end
