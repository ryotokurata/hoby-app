class Group < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :group_users
  has_many :users, through: :group_users
  validates :name, presence: true, uniqueness: true
end
