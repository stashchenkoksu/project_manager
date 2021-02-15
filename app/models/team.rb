# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :users
  has_and_belongs_to_many :projects

  validates :name, presence: true, length: { minimum: 2 }, uniqueness: true
end
