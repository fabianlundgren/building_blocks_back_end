require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :request do
    let(:headers) { {HTTP_ACCEPT: 'application/json'} }
    describe 'GET /api_v1_registrations_controllers' do
        it 'works! (now write some real specs)' do
            post 'api/v1/auth', params: { email: 'thoms@random.com',
                                             password: 'password',
                                             password_confirmation: 'password' },
                                             headers: headers
            expect(response).to have_http_status(200)
        end
    end
end
