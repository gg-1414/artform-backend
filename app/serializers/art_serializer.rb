class ArtSerializer < ActiveModel::Serializer
  attributes :id, :title, :starting_price, :img_url, :start_time, :winner_id
  has_many :tags
  has_many :biddings
  belongs_to :artist

  def tags
    object.tags.map do |tag|
      {
        id: tag.id,
        name: tag.name
      }
    end
  end

  def biddings
    object.biddings.map do |bidding|
      {
        id: bidding.id,
        bidder_id: bidding.bidder.id,
        bidder_name: bidding.bidder.name,
        bid_amount: bidding.bid_amount
      }
    end
  end

end
