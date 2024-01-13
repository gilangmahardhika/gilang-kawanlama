require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    context "before sign in" do
      it "should be redirected to home" do
        get "/products"
        expect(response.status).to eq(302)
      end
    end

    # context "when signed in" do
    #   let(:user) { FactoryBot.create(:user) }
    #   it "should response 200" do
    #     get "/products", params: {}, session: {user_id: user.id}
    #     expect(response.status).to eq(200)
    #   end
    # end
  end
end
