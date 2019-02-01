require 'rails_helper'

RSpec.describe "Users", type: :request do

  before(:all) do
    @user = create :user
    @user.save
    @jwt = Auth.issue({user: @user.id})
    @headers = { Authorization: "Bearer #{@jwt}"}
  end

  after(:all) do
    @user.destroy
  end

    # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { email: "foo@bar.com", name: "Foo B. Ar", password: "foobar", admin: false }
  }

  let(:invalid_attributes) {
    { email: "foo", name: "Foo B. Ar", password: "foofoo", admin: false }
  }

  describe "GET #index" do
    it "returns a success response" do
      user = User.create! valid_attributes
      get api_v1_users_path, params: {}, headers: @headers
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      user = User.create! valid_attributes
      get api_v1_user_url(user), params: {id: user.to_param}, headers: @headers
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post api_v1_users_url, params: {user: valid_attributes}
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do

        post api_v1_users_url, params: {user: valid_attributes}
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(api_v1_user_url(User.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new user" do

        post api_v1_users_url, params: {user: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { email: "bar@foo.com", password: "blahblah", admin: true, name: "Anne Admin" }
      }

      it "updates the requested user" do
        user = User.create! valid_attributes
        put api_v1_user_url(user), params: {id: user.to_param, user: new_attributes}, headers: @headers
        user.reload
        expect(user.email).to eq "bar@foo.com"
        expect(user.admin).to be true
      end

      it "renders a JSON response with the user" do
        user = User.create! valid_attributes

        put api_v1_user_url(user), params: {id: user.to_param, user: valid_attributes}, headers: @headers
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the user" do
        user = User.create! valid_attributes

        put api_v1_user_url(user), params: {id: user.to_param, user: invalid_attributes}, headers: @headers
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete api_v1_user_url(user), params: {id: user.to_param}, headers: @headers
      }.to change(User, :count).by(-1)
    end
  end
end
