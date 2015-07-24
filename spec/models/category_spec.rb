require 'rails_helper'

RSpec.describe Category do

  context 'Relations' do
    it {expect(subject).to have_many(:books) }
  end

  context 'Model validations' do
    context 'Presence of' do
      it { expect(subject).to validate_presence_of(:name) }
    end
  end

end
