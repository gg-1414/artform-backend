class Art < ApplicationRecord
  has_many :biddings
  belongs_to :artist
  has_many :art_tags
  has_many :tags, through: :art_tags

  def biddings_newest_to_oldest
    Bidding.where(art_id: self.id).order(created_at: :desc)
  end

  # def start
  #   biddings = self.biddings_newest_to_oldest
  #   if biddings.length > 0
  #     biddings[-1].created_at
  #   else
  #     ''
  #   end
  # end
  #
  # def start_formatted
  #   self.start
  # end

end
