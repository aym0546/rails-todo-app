class Board < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { minimum: 1, maximum: 100 }
  validates :title, uniqueness: true
  validates :description, length: { maximum: 250 }
  belongs_to :user
end
