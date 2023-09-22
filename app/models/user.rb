class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # юзер может создавать много событий
  has_many :events
  has_many :comments, dependent: :destroy
  has_many :subscriptions

  validates :name, presence: true, length: {maximum: 35}

  # при создании нового юзера(create), перед валидацией объекта выполнить метод set-name
  before_validation :set_name, on: :create

  after_commit :link_subscription, on: :create

  # mount_uploader :avatar, AvatarUploader
  has_one_attached :avatar

  private

  def set_name
    self.name = "Чувак №#{rand{777}}" if self.name.blank?
  end

  def link_subscription
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end
end
