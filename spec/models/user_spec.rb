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
    let(:second_user) { FactoryBot.create(:user, name: "Test", email: "test@example.com", password: "password") }

    it "creates a new user" do
      expect(user.save).to be_truthy
    end

    it "can update name" do
      second_user.name = "Gilang"
      second_user.save
      expect(second_user.name).to eq("Gilang")
    end

    it "can update email" do
      second_user.email = "gilangmahardhika@gmail.com"
      second_user.save
      expect(second_user.email).to eq("gilangmahardhika@gmail.com")
    end

    it "can update password" do
      second_user.password = "new_password"
      second_user.save
      expect(second_user.password).to eq("new_password")
    end

    it "can update role" do
      second_user.role = "User"
      second_user.save
      expect(second_user.role).to eq("User")
    end

    it "can delete user" do
      user = FactoryBot.create(:user, email: "delete@me.com")
      expect(User.find_by(email: "delete@me.com")).not_to eq(nil)

      user.delete
      expect(User.find_by(email: "delete@me.com")).to eq(nil)
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

  context "authorization" do
    let(:admin) { FactoryBot.create(:user) }
    let(:user) { FactoryBot.create(:user, role: "User") }

    it "has admin role" do
      expect(admin.is_admin?).to be_truthy
    end

    it "has user role" do
      expect(user.is_user?).to be_truthy
    end
  end
end
