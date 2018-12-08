class BiddingSerializer < ActiveModel::Serializer
  attributes :id, :art_id, :bidder, :bid_amount

  # def art
  #   {id: object.art.id,title: object.art.title}
  # end

  def bidder
    {id: object.bidder.id, name: object.bidder.name}
  end

end
