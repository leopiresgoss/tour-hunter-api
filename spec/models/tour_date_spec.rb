require 'rails_helper'

# Test suite for the Item model
RSpec.describe TourDate, type: :model do
  # Association test
  # ensure an TourDate record belongs to a single tour record
  it { should have_many(:reservations) }
  it { should belong_to(:tour) }
  # Validation test
  # ensure column date is present before saving
  it { should validate_presence_of(:date) }
end
