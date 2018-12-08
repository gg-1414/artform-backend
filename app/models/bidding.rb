class Bidding < ApplicationRecord
  belongs_to :bidder
  belongs_to :art

  # validates :bid_amount, number greater than 0
end
