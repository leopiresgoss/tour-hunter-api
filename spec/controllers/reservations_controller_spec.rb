require 'rails_helper'

describe Users::SessionsController, type: :request do
  let(:user) { create_user }
  let(:login_url) { '/users/sign_in' }
  let(:logout_url) { '/users/sign_out' }

  context 'When creating a reservation' do
    before do
      login_with_api(user)
      token = response.headers['Authorization']
      post '/tours', params: {
        name: 'Safari',
        location: 'Tehran',
        price: 1500,
        description: 'jkgdjh gasdjyhas sahgfdhgj',
        tour_dates_attributes: [{
          date: '2020-01-01'
        }]
      }, headers: { 'Authorization' => token }

      post '/reservations', params: {
        package: 'VIP',
        tour_date_id: TourDate.first['id']
      }, headers: { 'Authorization' => token }
    end

    it 'It should be able to create a reservation' do
      expect(Reservation.all.count).to be 1
    end

    it 'returns 201' do
      expect(response.status).to eq(201)
    end
  end

  context 'When getting a list of reservations' do
    before do
      login_with_api(user)
      token = response.headers['Authorization']
      post '/tours', params: {
        name: 'Safari',
        location: 'Tehran',
        price: 1500,
        description: 'jkgdjh gasdjyhas sahgfdhgj',
        tour_dates_attributes: [{
          date: '2020-01-01'
        }]
      }, headers: { 'Authorization' => token }

      post '/reservations', params: {
        package: 'VIP',
        tour_date_id: TourDate.first['id']
      }, headers: { 'Authorization' => token }

      get '/reservations', headers: { 'Authorization' => token }
    end

    it 'It should be able to see a list of reservations' do
      expect(response.body[0].length).to be 1
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

  context 'When Removing a reservations' do
    before do
      login_with_api(user)
      token = response.headers['Authorization']
      post '/tours', params: {
        name: 'Safari',
        location: 'Tehran',
        price: 1500,
        description: 'jkgdjh gasdjyhas sahgfdhgj',
        tour_dates_attributes: [{
          date: '2020-01-01'
        }]
      }, headers: { 'Authorization' => token }

      post '/reservations', params: {
        package: 'VIP',
        tour_date_id: TourDate.first['id']
      }, headers: { 'Authorization' => token }

      delete "/reservations/#{Reservation.first.id}", headers: { 'Authorization' => token }
    end

    it 'It should be able to delete the reservation' do
      expect(Reservation.all.count).to be 0
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end
end
