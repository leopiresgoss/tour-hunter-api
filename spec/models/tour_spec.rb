require 'rails_helper'

# Test suite for the Tour model
RSpec.describe Tour, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the tour_dates model
  it { should have_many(:tour_dates).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:price) }
end
