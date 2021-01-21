class Team < ApplicationRecord
  has_many :users
  has_and_belongs_to_many :projects

  validates :name, presence: true
  validates :name, uniqueness: true
end
