require 'rails_helper'

describe Authorization, type: :model do
  describe ".find_from_hash" do
    it "finds an existing Authorization" do
      hash = fake_auth_hash
      expected_auth = Authorization.create_from_hash(hash)

      expect(Authorization.find_from_hash(hash)).
        to eq(expected_auth)
    end
  end

  describe ".create_from_hash" do
    it "creates a Authorization for a given user" do
      hash = fake_auth_hash
      user = create(:user)

      auth = Authorization.create_from_hash(hash, user)

      expect(auth.user).to eq user
    end
  end
end
