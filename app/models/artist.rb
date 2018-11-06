class Artist < ApplicationRecord
  has_secure_password

  has_many :arts
  has_many :biddings, through: :arts

end
