require 'faker'
require 'factory_bot_rails'

module UserHelper
  def create_user
    FactoryBot.create(:user,
                      full_name: Faker::Lorem.word,
                      role: 'Admin',
                      email: Faker::Internet.email,
                      password: Faker::Internet.password)
  end

  def build_user
    FactoryBot.build(:user,
                     full_name: Faker::Lorem.word,
                     role: 'Admin',
                     email: Faker::Internet.email,
                     password: Faker::Internet.password)
  end
end
