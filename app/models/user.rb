# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tasks
  belongs_to :team, optional: true
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
