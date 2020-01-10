class Chat < ApplicationRecord
  belongs_to :message
  belongs_to :group
  belongs_to :user
  validates :comment, presence: true
end
