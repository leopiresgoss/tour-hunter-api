require 'rails_helper'

describe Users::SessionsController, type: :request do
  let(:user) { create_user }
  let(:login_url) { '/users/sign_in' }
  let(:logout_url) { '/users/sign_out' }

  context 'When creating a tour' do
    before do
      login_with_api(user)
      token = response.headers['Authorization']
      post '/tours', params: {
        name: 'Safari',
        location: 'Tehran',
        price: 1500,
        description: 'jkgdjh gasdjyhas sahgfdhgj'
      }, headers: { 'Authorization' => token }
    end

    it 'It should be able to create a tour' do
      expect(Tour.all.count).to be 1
    end

    it 'The tour name should be saved' do
      expect(Tour.first.name).to eq('Safari')
    end

    it 'returns 201' do
      expect(response.status).to eq(201)
    end
  end

  context 'When Editing a tour' do
    before do
      login_with_api(user)
      token = response.headers['Authorization']
      post '/tours', params: {
        name: 'Safari',
        location: 'Tehran',
        price: 1500,
        description: 'jkgdjh gasdjyhas sahgfdhgj'
      }, headers: { 'Authorization' => token }

      put "/tours/#{Tour.first.id}", params: {
        name: 'new_name'
      }, headers: { 'Authorization' => token }
    end

    it 'It should be able to edit a tour' do
      expect(Tour.all.count).to be 1
    end

    it 'The tour name should be updated' do
      expect(Tour.first.name).to eq('new_name')
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

  context 'When Deleting a tour' do
    before do
      login_with_api(user)
      token = response.headers['Authorization']
      post '/tours', params: {
        name: 'Safari',
        location: 'Tehran',
        price: 1500,
        description: 'jkgdjh gasdjyhas sahgfdhgj'
      }, headers: { 'Authorization' => token }

      delete "/tours/#{Tour.first.id}", headers: { 'Authorization' => token }
    end

    it 'It should be able to delet a tour' do
      expect(Tour.all.count).to be 0
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

  context 'When Getting a list of tours' do
    before do
      login_with_api(user)
      token = response.headers['Authorization']
      post '/tours', params: {
        name: 'Safari',
        location: 'Tehran',
        price: 1500,
        description: 'jkgdjh gasdjyhas sahgfdhgj'
      }, headers: { 'Authorization' => token }

      post '/tours', params: {
        name: 'Safari2',
        location: 'Esfahan',
        price: 2500,
        description: 'jkgdjh gasdjyhas sahgfdhgj'
      }, headers: { 'Authorization' => token }

      get '/tours', headers: { 'Authorization' => token }
    end

    it 'It should be return a list of tours' do
      expect(response.body).to include('Safari') && include('Safari2')
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

  context 'When Getting a single tour' do
    before do
      login_with_api(user)
      token = response.headers['Authorization']
      post '/tours', params: {
        name: 'Safari',
        location: 'Tehran',
        price: 1500,
        description: 'jkgdjh gasdjyhas sahgfdhgj'
      }, headers: { 'Authorization' => token }

      get "/tours/#{Tour.first.id}", headers: { 'Authorization' => token }
    end

    it 'It should return the tour' do
      expect(response.body).to include('Safari')
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end
end
