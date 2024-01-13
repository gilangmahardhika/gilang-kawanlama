require 'rails_helper'

RSpec.describe "Home", type: :request do
  describe "GET /" do
    context "when logged out" do
      it "gets 200 on index" do
        get "/"
        expect(response.status).to eq(200)
      end
    end
  end
end
