class Task < ApplicationRecord
  self.per_page = 5
  belongs_to :project
  belongs_to :user, optional: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true, length: { minimum: 2}
  validates :content, presence: true, length: { minimum: 10}
  validates :status, inclusion: { in: ["not started ","begin", "in progress", "done"],
                                message: "it is not a status(not started, begin, in progress, done)" }, allow_nil: true

end

