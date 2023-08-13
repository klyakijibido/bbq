class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # юзер может создавать много событий
  has_many :events
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: {maximum: 35}

  # при создании нового юзера(create), перед валидацией объекта выполнить метод set-name
  before_validation :set_name, on: :create

  private

  def set_name
    self.name = "Чувак №#{rand{777}}" if self.name.blank?
  end
end
