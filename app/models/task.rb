class Task < ApplicationRecord
  belongs_to :project
  has_many :comments, as: :commentable, dependent: :destroy

  validates :status, inclusion: { in: ["not started ","begin", "in progress", "done"],
                                message: "%{value} is not a status(begin, in progress, done)" }, allow_nil: true
end
