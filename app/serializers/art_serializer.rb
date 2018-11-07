class ArtSerializer < ActiveModel::Serializer
  attributes :id, :artist, :title, :starting_price, :img_url, :open
  has_many :tags
  has_many :biddings

  def artist
    object.artist.name
  end

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
        bidder_id: bidding.bidder_id,
        bid_amount: bidding.bid_amount
      }
    end
  end
end
