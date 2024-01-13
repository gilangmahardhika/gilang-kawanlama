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

      it "should logged in successfully" do
        post "/sign_in", params: valid_params
        expect(response).to have_http_status :created

      end

      it "should be fail on login" do
        post "/sign_in", params: wrong_params
        expect(response).to have_http_status :unauthorized
      end
    end
  end
end
