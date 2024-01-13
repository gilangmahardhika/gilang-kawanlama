require 'rails_helper'

RSpec.describe Product, type: :model do
  context "validation" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:sku) }
    it { should validate_presence_of(:count) }
    it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:sku) }
    it { should validate_numericality_of(:count) }
  end
end
