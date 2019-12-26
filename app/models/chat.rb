class Chat < ApplicationRecord
  belongs_to :message
  belongs_to :group
  belongs_to :user
end
