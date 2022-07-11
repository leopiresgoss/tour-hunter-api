require 'rails_helper'

# Test suite for the Reservation model
RSpec.describe Reservation, type: :model do
  # Association test
  # ensure a reservation record belongs to a single tour_date record
  it { should belong_to(:tour_date) }
  # Validation test
  # ensure column package is present before saving
  it { should validate_presence_of(:package) }
end
