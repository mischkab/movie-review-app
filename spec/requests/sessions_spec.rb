require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /create" do
    it "returns http success and session id is created" do
      # arrange
      body = { 
        user: {
          username: "user_one",
          password: "password1",
          email: "email@test.com"
        }
      }
      user_one = User.create(username: body[:user][:username], password: body[:user][:password], email: body[:user][:email])

      # act
      post "/login", params: body
      
      # assert
      expect(response).to have_http_status(:created)
      expect(session[:user_id]).to eq (user_one.id)
    end
  end

  describe "DELETE /destroy" do
    it "returns http success and session id is removed" do
      delete "/logout"
      expect(response).to have_http_status(:success)
      expect(session[:user_id]).to be_nil
    end
  end
end
