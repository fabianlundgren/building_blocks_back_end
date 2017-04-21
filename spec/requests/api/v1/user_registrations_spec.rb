require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :request do
    let(:headers) { { HTTP_ACCEPT: 'application/json' } }
    describe 'create tenant' do
        it 'creates tenant when passed in valid attributes' do
            post '/api/v1/auth', params: { email: 'thomas@random.com',
                                           password: 'password',
                                           password_confirmation: 'password' },
                                 headers: headers
            expect(response).to have_http_status(200)
            expect(User.last.email).to eq 'thomas@random.com'
        end
    end

    describe 'create admin' do
        it 'creates admin when passed in valid attributes' do
            post '/api/v1/auth', params: { email: 'admin@random.com',
                                           password: 'password',
                                           password_confirmation: 'password',
                                           role: 'admin' },
                                 headers: headers
            expect(response).to have_http_status(200)
            expect(User.last.role).to eq 'admin'
        end

        it 'returns error when email is missing' do

        end

        it 'returns error is password confirmation is not a match' do

        end
    end
end
