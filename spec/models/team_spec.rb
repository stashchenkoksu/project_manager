require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'associations' do
    it 'has many assosiation', :aggregate_failures do
      expect(subject).to have_many(:users)
    end

    it 'has belong to associations', :aggregate_failures do
      expect(subject).to  have_and_belong_to_many(:projects)
    end
  end

  describe 'validations' do
    it 'has presence validate', :aggregate_failures do
      expect(subject).to validate_presence_of(:name)
    end
    it 'has length validate', :aggregate_failures do
      expect(subject).to validate_length_of(:name).is_at_least(2)
    end
    it 'has unique validate', :aggregate_failures do
      expect(subject).to validate_uniqueness_of(:name)
    end
  end
end
