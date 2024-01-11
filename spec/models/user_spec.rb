require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:role) }
    it do
      should validate_inclusion_of(:role).
        in_array(User::ROLES)
    end
  end

  context "CRUD" do
    let(:user) { FactoryBot.build(:user) }

    it "creates a new user" do
      expect(user.save).to be_truthy
    end

  end

  context "authentications" do
    let(:user) { FactoryBot.create(:user, email: "gilangmahardhika@gmail.com", password: "password") }

    it "gets successful auth when password is correct" do
      expect(user.authenticate("password")).to be_truthy
    end

    it "gets failed auth when password is incorrect" do
      expect(user.authenticate("password123")).to be_falsy
    end
  end
end
