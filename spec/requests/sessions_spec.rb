require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  let(:valid_attributes) {
    { email: "foo@bar.com", name: "Foo B. Ar", password: "foobar", admin: false }
  }
  
  describe "POST #create" do
    it "logs in with valid credentials" do
      user = User.create! valid_attributes
      post api_v1_login_path, params: {auth: {email: valid_attributes[:email], password: valid_attributes[:password]}}
      expect(response).to be_successful
    end

    it "fails with invalid email" do
      user = User.create! valid_attributes
      post api_v1_login_path, params: {auth: {email: "bar@foo.com", password: valid_attributes[:password]}}
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "fails with invalid password" do
      user = User.create! valid_attributes
      post api_v1_login_path, params: {auth: {email: valid_attributes[:email], password: "blahblah"}}
      expect(response).to have_http_status(:unprocessable_entity)
    end  
  end

end
