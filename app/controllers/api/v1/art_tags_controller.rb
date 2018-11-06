class Api::V1::ArtTagsController < ApplicationController
  def index
    @art_tags = ArtTag.all
    render json: @art_tags
  end

  def create
    @art_tag = ArtTag.new(art_tag_params)

    if @art_tag.save
      render json: @art_tag, status: :created
    else
      render json: @art_tag.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @art_tag = ArtTag.find(params[:id])
    @art_tag.destroy
  end

  private
  def art_tag_params
    params.require(:art_tag).permit(:art_id, :tag_id)
  end
end
