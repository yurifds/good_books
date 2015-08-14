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
end
