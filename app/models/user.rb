class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boards, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :profile, dependent: :destroy

  delegate :nickname, to: :profile, allow_nil: true

  def prepare_profile
    profile || build_profile
  end

  def display_name
    profile&.nickname || self.email.split('@').first
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default.svg'
    end
  end

  GUEST_EMAIL = 'guest@example.com'

  def self.guest
    find_or_create_by!(email: GUEST_EMAIL) do |user|
      user.password = 'guest_password'
      user.password_confirmation = 'guest_password'
    end
  end
end
