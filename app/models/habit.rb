class Habit < ApplicationRecord
  belongs_to :user
  has_many :events
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 140 }
end
