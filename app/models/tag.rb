class Tag < ApplicationRecord
  has_many :art_tags
  has_many :arts, through: :art_tags
end
