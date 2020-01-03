class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :chats
  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      where(['content LIKE ?', "%#{search}%"]) 
    else
      all #全て表示させる
   end
  end
end
