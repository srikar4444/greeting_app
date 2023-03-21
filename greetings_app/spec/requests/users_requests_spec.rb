require 'rails_helper'
# require 'forgery'

RSpec.describe "UsersController", type: :request do

  describe "GET #index" do
    # let!(:user_1) { create(:user, name: 'user 1') }
    # let!(:user_2) { create(:user, name: 'user 2') }
    # let!(:headers) { { ACCEPT: 'application/json', 'HTTP-USER-ID': student.id } }

    # it "returns a success response" do
    #   get('/users')
    #   json_response = JSON.parse(response.body).with_indifferent_access
    #   expect(response).to have_http_status(200)
    #   expect(json_response['users'].sample.keys).to match_array(%w(id name created_at))
    #   # expect(json_response[:users][:profile_photo_status]).to eq('not_uploaded')
    #   # expect(json_response[:student_profile][:profile_photo_url]).to eq('https://example.com/initial_avatars/default.png')
    # end

    # it "assigns all users as @users" do
    #   user = FactoryBot.create(:user)
    #   get :index
    #   expect(assigns(:users)).to eq([user])
    # end
  end
end