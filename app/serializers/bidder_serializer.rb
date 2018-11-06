class BidderSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :name, :picture
  has_many :biddings

  def biddings
    object.biddings.map do |bidding|
      {
        id: bidding.id,
        art: {
          id: bidding.art.id,
          artist_id: bidding.art.artist_id,
          title: bidding.art.title,
          starting_price: bidding.art.starting_price,
          img_url: bidding.art.img_url
        },
        bid_amount: bidding.bid_amount
      }
    end
  end
end
