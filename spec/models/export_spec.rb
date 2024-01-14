# require 'rails_helper'

# RSpec.describe Export, type: :model do
#   context "validations" do
#     it { should validate_presence_of(:user_id) }
#     it { should validate_presence_of(:status) }
#     it do
#       should validate_inclusion_of(:status).
#         in_array(Export::STATUS)
#     end
#   end

#   describe "data integrity" do
#     it { should belong_to(:user) }

#     let(:user) { FactoryBot.create(:user, name: "Gilang", email: "gilangmahardhika@gmail.com") }
#     let(:export) { FactoryBot.build(:export, user: user, status: "InProgress") }


#     it "should get user name" do
#       export.save
#       expect(export.user_name).to eq("Gilang")
#     end

#     it "should get user email" do
#       export.save
#       expect(export.user_email).to eq("gilangmahardhika@gmail.com")
#     end

#     it "should has InProgress status" do
#       export.save
#       expect(export.status).to eq("InProgress")
#     end

#     it "should has Finished status" do
#       export.status = "Finished"
#       export.save
#       expect(export.status).to eq("Finished")
#     end
#   end

# end
