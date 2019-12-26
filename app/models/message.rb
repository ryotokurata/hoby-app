class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :chats
  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
