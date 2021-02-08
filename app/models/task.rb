class Task < ApplicationRecord
  self.per_page = 5
  belongs_to :project
  belongs_to :user, optional: true
  has_many :comments, as: :commentable, dependent: :destroy

  validates :status, inclusion: { in: ["not started ","begin", "in progress", "done"],
                                message: "%{value} is not a status(begin, in progress, done)" }, allow_nil: true
end
