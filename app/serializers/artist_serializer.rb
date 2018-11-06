class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest, :name, :img_url
  has_many :arts

  def arts
    object.arts.map do |art|
      {
        id: art.id,
        title: art.title,
        starting_price: art.starting_price,
        img_url: art.img_url
      }
    end
  end
end
