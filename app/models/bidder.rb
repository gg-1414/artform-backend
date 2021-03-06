class Bidder < ApplicationRecord
  has_secure_password

  has_many :biddings
  has_many :arts, through: :biddings

  validates :email, presence: true, uniqueness: true
  # validates :password, length: { in: 6..20 }
  validates :name, presence: true, length: { minimum: 2 }
end
