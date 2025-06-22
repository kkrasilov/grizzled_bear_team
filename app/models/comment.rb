class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  scope :sorted, -> { order(:id) }

  validates :body, presence: true
end
