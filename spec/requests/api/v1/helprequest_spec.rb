require 'rails_helper'

RSpec.describe Api::V1::HelpRequestsController, type: :request do
  let!(:user) { create(:user, email: "mail@mail.com",
    password: "12345678")}
    login_as(user, scope: :user)

  describe 'POST /v1/help_requests' do
    it 'should collect call for help message from mobile client' do

      params = {
        title: 'Burning',
        message: 'Pants is burning',
        urgent: true
                }

      post '/api/v1/help_requests', params

      expect(response.code).to eq '200'
      object = HelpRequest.find_by(title: 'Burning', message: 'Pants is burning', urgent: true )
      expect(object).to be_persisted
    end
    it 'should render code 400 on failure' do
      post '/api/v1/help_requests'
      expected_response = {message: ["Title can't be blank", "Message can't be blank", "Urgent can't be blank"]}
      expect(response.code).to eq '400'
   end
  end
end
