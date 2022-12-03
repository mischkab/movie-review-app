require 'rails_helper'

RSpec.describe "Users", type: :request do
  # describe "GET /index" do
  #   pending "add some examples (or delete) #{__FILE__}"
  # end

  describe "POST /users" do
    it "creates a user with valid parameters" do
      #arrange
      body = { 
        user: {
          username: "user_one",
          password: "password1",
          email: "email@test.com"
        }
      }
      
      #act
      post "/users", params: body

      #assert
      expect(response).to have_http_status(:created)
      expect(response.body).to include("user_one")
    end
  end
end
