require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it 'has many assosiation', :aggregate_failures do
      expect(subject).to have_many(:comments)
      expect(subject).to have_many(:tasks)
    end

    it 'has belong to associations', :aggregate_failures do
      expect(subject).to  have_and_belong_to_many(:teams)
    end
  end

  describe 'validations' do
    it 'has presence validate', :aggregate_failures do
      expect(subject).to validate_presence_of(:name)
      expect(subject).to validate_presence_of(:summary)
    end
    it 'has length validate', :aggregate_failures do
      expect(subject).to validate_length_of(:name).is_at_least(2)
      expect(subject).to validate_length_of(:summary).is_at_least(10)
    end
  end
end
