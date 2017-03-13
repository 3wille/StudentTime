require 'rails_helper'

RSpec.describe TimeEntry, type: :model do
  context "attributes" do
    it { is_expected.to respond_to(:user) }
  end
end
