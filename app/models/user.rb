class User < ApplicationRecord
  has_many :events

  validates :name, presence: true, length: {maximum: 35}
  validates :email, presence: true, length: {maximum: 255}
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[a-z0-9._%+-]+@[a-z0-9-]+.+.[a-z]{2,4}\z/ }
end