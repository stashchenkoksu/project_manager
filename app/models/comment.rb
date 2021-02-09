class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user

  validates :body, presence: true
end
