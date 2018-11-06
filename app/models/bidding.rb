class Bidding < ApplicationRecord
  belongs_to :bidder
  belongs_to :art
end
