require 'rails_helper'

RSpec.describe User, type: :model do
  context "attributes" do
    it { is_expected.to respond_to :time_entries }
  end

  describe "#name" do
    it "returns the users name" do
      user = User.create(name: "Jon Doe")

      expect(user.name).to eq("Jon Doe")
    end
  end

  describe "#from_omniauth!" do
    it "creates a new user with the name given in the hash" do
      user = User.from_omniauth!({
        info: {
          name: "Jon Doe",
        },
      }.deep_stringify_keys)

      expect(user.name).to eq "Jon Doe"
    end
  end
end
