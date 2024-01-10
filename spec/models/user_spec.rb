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
end
