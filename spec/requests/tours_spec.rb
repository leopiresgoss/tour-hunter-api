require 'rails_helper'

RSpec.describe 'Tours API', type: :request do
  # initialize test data

  let!(:tours) { create_list(:tour, 10) }
  let(:tour_id) { tours.first.id }

  # Test suite for GET /todos
  describe 'GET /tours' do
    # make HTTP get request before each example
    before { get '/tours' }

    it 'returns tours' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /todos/:id
  describe 'GET /tours/:id' do
    before { get "/tours/#{tour_id}" }

    context 'when the record exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(todo_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:todo_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end
  end

  # Test suite for POST /tours
  describe 'POST /tours' do
    # valid payload
    let(:valid_attributes) { { name: 'Learn Elm', location: 'Peru', description: 'My description', price: 15 } }

    context 'when the request is valid' do
      before { post '/tours', params: valid_attributes }

      it 'creates a todo' do
        expect(json['name']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/tours', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /todos/:id
  describe 'PUT /todos/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/todos/#{todo_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /tours/:id
  describe 'DELETE /tours/:id' do
    before { delete "/tours/#{todo_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
