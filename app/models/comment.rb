class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :comments, as: :commentable, dependent: :destroy

  belongs_to :user
end
