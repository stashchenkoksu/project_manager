class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_and_belongs_to_many :teams
  has_many :comments, as: :commentable, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :summary, presence: true, length: { minimum: 10}

end
