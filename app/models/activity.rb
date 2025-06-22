class Activity < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  scope :sorted, -> { order(id: :desc) }
  
  enum :category, {
    cycling: 'cycling',
    virtual_cycling: 'virtual_cycling'
  }

  enum :ride_type, {
    activity: 'activity',
    competition: 'competition'
  }

  validates :distance, presence: true
  validates :duration_hours, presence: true
  validates :duration_minutes, presence: true
  validates :elevation, presence: true
  validates :title, presence: true
  validates :start_time, presence: true
end
