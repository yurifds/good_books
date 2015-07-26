require 'rails_helper'

RSpec.describe Rating do

  context "Relations" do
    it { expect(subject).to belong_to(:user) }
    it { expect(subject).to belong_to(:book) }
  end

  context "Presence of" do
    it { expect(subject).to validate_presence_of(:points) }
  end

end
