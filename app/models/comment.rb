class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :content, presence: true
  validates :content, length: { minimum: 1, maximum: 256 }

  def avatar_img
    user.avatar_image
  end

end
