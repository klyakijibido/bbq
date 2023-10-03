class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  has_one_attached :photo do |attachable|
    attachable.variant(resize: "100x100")
  end

  validates :event, presence: true
  validates :user, presence: true

  scope :persisted, -> { where "id IS NOT NULL" }
end
