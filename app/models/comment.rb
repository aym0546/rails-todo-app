class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :content, presence: true
  validates :content, length: { minimum: 1, maximum: 256 }

end
