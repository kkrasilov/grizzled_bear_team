class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  enum :gender, {
    male: 'male',
    female: 'female'
  }

  validates :email, uniqueness: true
  validates :email, presence: true

  has_one_attached :avatar

  def short_name
    "#{surname} #{first_name}"
  end
end
