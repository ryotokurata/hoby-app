class Group < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages
  has_many :chats
  validates :name, presence: true, uniqueness: true
end

# , unless: :image?