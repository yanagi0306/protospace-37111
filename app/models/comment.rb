class Comment < ApplicationRecord
  validates :context,presence: true
  belongs_to :prototype
  belongs_to :user
end
