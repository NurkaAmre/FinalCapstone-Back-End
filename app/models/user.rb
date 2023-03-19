class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :books, through: :reservations

  validates :user_name, presence: true
  validates :email, presence: true
end
