class Bidder < ApplicationRecord
  has_secure_password

  has_many :biddings
  has_many :messages
  has_many :arts, through: :biddings

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password, length: { in: 3..20 }
  validates :name, presence: true, length: { minimum: 2 }
end
