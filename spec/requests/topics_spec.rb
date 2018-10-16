require 'rails_helper'

RSpec.describe 'Topics API', type: :request do
  let(:user) { create(:user) }
  let!(:topics) { create_list(:topic, 10, user_id: user.id) }
  let(:topic_id) { topics.first.id }

  let(:headers) { {'Accept' => 'application/json', 'Content-Type' => 'application/json'} }
    # This will add a valid token for `user` in the `Authorization` header
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers(headers, user) }

  describe 'GET /api/topics' do
    before { get '/api/topics' }

    it 'returns topics' do
      expect(json).not_to be_empty
      expect(json['topics'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/topics' do
    let(:valid_attr) { { title: 'AAAAA BBB', body: 'BODY AAAAA', user_id: user.id } }

    context 'when the request is valid' do
      before { post '/api/topics', params: valid_attr.to_json, headers: auth_headers }

      it 'creates a topic' do
        expect(json['topic']['title']).to eq('AAAAA BBB')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end

  end

end