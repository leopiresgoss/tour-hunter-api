require 'rails_helper'

describe Users::RegistrationsController, type: :request do
  let(:user) { build_user }
  let(:existing_user) { create_user }
  let(:signup_url) { '/users' }
  let(:login_url) { '/users/sign_in' }
  context 'When creating a new user' do
    before do
      post signup_url, params: {
        user: {
          full_name: user.full_name,
          role: user.role,
          email: user.email,
          password: user.password,
          password_confirmation: user.password_confirmation,
          confirmed_at: user.confirmed_at
        }
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns Signed up.' do
      expect(response.body).to eq('{"message":"Signed up."}')
    end

    it 'user is confirmed' do
      expect(user.confirmed?).to eq(true)
    end

    it 'login' do
      post login_url, params: {
        user: {
          email: existing_user.email,
          password: existing_user.password
        }
      }
      expect(response.headers['Authorization']).to be_present
    end
  end
end
