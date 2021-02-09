require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it 'belong to assosiation', :aggregate_failures do
      expect(subject).to belong_to(:commentable)
      expect(subject).to belong_to(:user)
    end
    it 'has many associations', :aggregate_failures do
      expect(subject).to  have_many(:comments)
    end
  end

  describe 'validations' do
    it 'has presence validate', :aggregate_failures do
      expect(subject).to validate_presence_of(:body)
    end
  end
end
