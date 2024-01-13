require 'rails_helper'

RSpec.describe "Authentications", type: :request do
  context "Sign in" do
    describe "POST /sign_in and get the correct auth if email and password correct" do
      let(:user) { FactoryBot.create(:user, email: "test@example.com", password: "password") }
      let(:valid_params) {
        {
          auth: {
            email: "test@example.com",
            password: "password"
          }
        }
      }

      let(:wrong_params) {
        {
          auth: {
            email: "test@example.com",
            password: "passasdsaword"
          }
        }
      }

      xit "should logged in successfully" do
        post "/sign_in", params: valid_params
        expect(response).to redirect_to(products_path)

      end

      it "should be fail on login" do
        post "/sign_in", params: wrong_params
        expect(response.status).to redirect_to(root_path)
      end
    end
  end
end
