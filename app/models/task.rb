class Task < ApplicationRecord

  after_initialize :set_default_deadline, if: :new_record?

  validates :title, presence: true
  validates :title, length: { maximum: 256 }
  validates :content, length: { maximum: 1000 }
  validate :deadline_cannot_be_in_the_past

  belongs_to :user
  belongs_to :board

  private

  def deadline_cannot_be_in_the_past
    if deadline.present? && deadline < Date.today
      errors.add(:deadline, 'は今日以降の日付を指定してください')
    end
  end

  def set_default_deadline
    self.deadline ||= Date.tomorrow
  end

end
