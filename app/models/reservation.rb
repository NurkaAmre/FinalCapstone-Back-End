class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :book, class_name: 'Book'

  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :city, presence: true
  validates :date_of_booking, presence: true
  validates :date_of_delivery, presence: true
end
