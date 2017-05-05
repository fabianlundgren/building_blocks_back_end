require 'rails_helper'

RSpec.describe Api::V1::FacilitiesController, type: :request do
  let!(:facility) { create(:facility,
    name: 'Sauna',
    description: 'Hot hot Sauna',
    rules: 'No Underwear',
    status: true)}

  describe 'GET /v1/facilities' do
    it 'should return all the facilities name, description, rules and status' do
      get '/api/v1/facilities'

      expected_response = [{
        'id' => facility.id,
        'name' => 'Sauna',
        'description' => 'Hot hot Sauna',
        'rules' => 'No Underwear',
        'status' => true
      }]

      expect(response_json).to eq expected_response
      expect(response.status).to eq 200
    end
  end

  describe 'GET /v1/facilities' do
    it 'should return one facility name, description, rules' do
      get "/api/v1/facilities/#{facility.id}"

      expected_response = {
        'name' => 'Sauna',
        'description' => 'Hot hot Sauna',
        'rules' => 'No Underwear',
      }

      expect(response_json).to eq expected_response
      expect(response.status).to eq 200
    end

    it 'should render error message on failure' do
      get '/api/v1/facilities/999999'
      expected_response = {message: "Couldn't find Facility with 'id'=999999"}
      expect(response_json).to eq JSON.parse(expected_response.to_json)
      expect(response.status).to eq 404
   end
  end
end
