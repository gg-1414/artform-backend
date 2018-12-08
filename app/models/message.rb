class Message < ApplicationRecord
  belongs_to :bidder
end

# Juan has won Line Drawing
# ${winner} has won ${art.name}

# Message.new(bidder_id: 1, message: "")
# Message.new(bidder_id: 2, message: "")
