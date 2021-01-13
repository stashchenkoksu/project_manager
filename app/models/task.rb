class Task < ApplicationRecord
  belongs_to :project

  validates :status, inclusion: { in: ["begin", "in progress", "done"],
                                message: "%{value} is not a status(begin, in progress, done)" }, allow_nil: true
end
