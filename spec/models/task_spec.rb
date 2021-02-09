require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it 'belong to assosiation', :aggregate_failures do
      expect(subject).to belong_to(:project)
      expect(subject).to belong_to(:user)
    end

    it 'has many associations', :aggregate_failures do
      expect(subject).to  have_many(:comments)
    end
  end

  describe 'validations' do
    it 'has presence validate', :aggregate_failures do
      expect(subject).to validate_presence_of(:title)
      expect(subject).to validate_presence_of(:content)
    end
    it 'validate inclusion' do
      expect(subject).to validate_inclusion_of(:status).in_array(["not started ","begin", "in progress", "done"]).with_message("it is not a status(not started, begin, in progress, done)")
    end
    it 'has length validate', :aggregate_failures do
      expect(subject).to validate_length_of(:title).is_at_least(2)
      expect(subject).to validate_length_of(:content).is_at_least(10)
    end
  end
end
