class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_and_belongs_to_many :teams
  validates :name, length: { minimum: 2 }
end
