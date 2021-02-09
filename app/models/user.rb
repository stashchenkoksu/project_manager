class User < ApplicationRecord
  has_many :tasks
  belongs_to :team, optional: true
  validates :first_name,presence: true,  length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :admin, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
