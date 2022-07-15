require 'swagger_helper'

describe 'Tour Hunter API' do
  path '/users' do
    post 'Create a user' do
      tags 'User'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            properties: {
              full_name: { type: :string },
              role: { type: :string },
              email: { type: :string },
              pasword: { type: :string }
            }
          }

        },
        required: %w[full_name email password]
      }

      response '200', 'user created' do
        let(:user) { { email: 'dodo@gmail.com', password: 'hidden' } }
      end

      response '400', 'invalid request' do
        let(:user) { { email: 'foo@gmail.com' } }
      end
    end
  end

  path '/users/sign_in' do
    post 'Login' do
      tags 'User Login'
      consumes 'application/json', 'application/xml'
      parameter name: :pet, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            properties: {
              email: { type: :string },
              pasword: { type: :string }
            }
          }

        },
        required: %w[email password]
      }

      response '200', 'user logged' do
        let(:user) { { email: 'dodo@gmail.com', password: 'hidden' } }
      end

      response '401', 'invalid request' do
        let(:user) { { email: 'foo@gmail.com' } }
      end
    end
  end

  path '/tours' do
    post 'Create a Tour' do
      tags 'Tours'
      consumes 'application/json', 'application/xml'
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :tour, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          location: { type: :string },
          price: { type: :number },
          description: { type: :string }

        },
        required: %w[name location price description]
      }

      response '200', 'tour created' do
        let(:tour) { { name: 'Machu Picchu', location: 'Peru', price: 10, description: 'A beautiful place in Peru' } }
      end

      response '400', 'invalid request' do
        let(:tour) { { name: 'Machu Picchu' } }
      end
    end
  end

  path '/tours/{id}' do
    put 'Update a Tour' do
      tags 'Tours'
      consumes 'application/json', 'application/xml'
      parameter name: :id, in: :path, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: %w[name]
      }

      response '200', 'tour updated' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 location: { type: :string },
                 price: { type: :number },
                 description: { type: :string }
               },
               required: %w[name location price description]

        let(:id) { Tour.update(name: 'Huacachina', location: 'Peru', price: 15, description: 'Best place in Peru').id }
      end

      response '400', 'invalid request' do
        let(:user) { { email: 'foo@gmail.com' } }
      end
    end
  end

  path '/tours/{id}' do
    delete 'Delete a Tour' do
      tags 'Tours'
      consumes 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'tour deleted' do
        let(:id) { Tour.destroy(name: 'Huacachina', location: 'Peru', price: 15, description: 'Best place in Peru').id }
      end
    end
  end

  path '/tours' do
    get 'Get list of Tours' do
      tags 'Tours'
      consumes 'application/json', 'application/xml'
      parameter name: :tour, in: :body

      response '200', 'list of tours' do
        let(:tour) { Tour.all }
      end
    end
  end

  path '/tours/{id}' do
    get 'Show a tour' do
      tags 'Tours'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'show a tour' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 location: { type: :string },
                 price: { type: :number },
                 description: { type: :string }
               },
               required: %w[name location price description]

        let(:id) { Tour.create(name: 'Huacachina', location: 'Peru', price: 15, description: 'Best place in Peru').id }
      end
    end
  end

  # Reservations

  path '/reservations' do
    post 'Create a Reservation' do
      tags 'Reservations'
      consumes 'application/json', 'application/xml'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          package: { type: :string },
          tour_date_id: { type: :integer }

        },
        required: %w[package tour_date_id]
      }

      response '200', 'reservation created' do
        let(:reservation) { { package: 'Premium', tour_date_id: 1 } }
      end

      response '400', 'invalid request' do
        let(:reservation) { { package: 'economic' } }
      end
    end
  end

  path '/reservations/{id}' do
    put 'Update a Reservation' do
      tags 'Reservations'
      consumes 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string, schema: {
        type: :object,
        properties: {
          package: { type: :string }
        },
        required: %w[package]
      }

      response '200', 'reservation updated' do
        schema type: :object,
               properties: {
                 package: { type: :string },
                 tour_date_id: { type: :integer }

               },
               required: %w[package tour_date_id]

        let(:id) { Reservation.update(package: 'Economic', tour_date_id: 1).id }
      end

      response '400', 'invalid request' do
        let(:resertavion) { { package: 'premium' } }
      end
    end
  end

  path '/reservations/{id}' do
    delete 'Delete a Reservation' do
      tags 'Reservations'
      consumes 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'reservation deleted' do
        let(:id) { Reservation.destroy.id }
      end
    end
  end

  path '/reservations' do
    get 'Get list of reservations' do
      tags 'Reservations'
      consumes 'application/json', 'application/xml'
      parameter name: :tour, in: :body

      response '200', 'list of reservations' do
        let(:tour) { Tour.all }
      end
    end
  end

  path '/reservations/{id}' do
    get 'Show a reservation' do
      tags 'Reservations'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'show a reservation' do
        schema type: :object,
               properties: {
                 package: { type: :string },
                 tour_date_id: { type: :integer }
               },
               required: %w[package tour_date_id]

        let(:id) { Reservation.create(package: 'Premium', tour_date_id: 1).id }
      end
    end
  end
end
