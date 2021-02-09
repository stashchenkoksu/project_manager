require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'belong to assosiation', :aggregate_failures do
      expect(subject).to belong_to(:team)
    end
    it 'has many associations', :aggregate_failures do
      expect(subject).to  have_many(:tasks)
    end
  end

  describe 'validations' do
    it 'has presence validate', :aggregate_failures do
      expect(subject).to validate_presence_of(:first_name)
      expect(subject).to validate_presence_of(:last_name)
      expect(subject).to validate_presence_of(:admin)
    end
    it 'has length validate', :aggregate_failures do
      expect(subject).to validate_length_of(:first_name).is_at_least(2)
      expect(subject).to validate_length_of(:last_name).is_at_least(2)
    end
  end
end
