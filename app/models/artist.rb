class Artist < ApplicationRecord
  has_secure_password

  has_many :arts
  has_many :biddings, through: :arts

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password, length: { in: 3..20 }
  validates :password_confirmation, presence: true
  validates :name, presence: true, length: { minimum: 2 }
  validates :img_url, presence: true
end
