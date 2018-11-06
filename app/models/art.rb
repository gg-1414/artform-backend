class Art < ApplicationRecord
  has_many :biddings
  belongs_to :artist
  has_many :art_tags
  has_many :tags, through: :art_tags
end
