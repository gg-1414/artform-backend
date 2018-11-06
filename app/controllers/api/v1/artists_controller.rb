class Api::V1::ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    render json: @artists
  end

  def show
    @artist = Artist.find(params[:id])
    render json: @artist
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      render json: @artist, status: :created
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      render json: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
  end

  private
  def artist_params
    params.require(:artist).permit(:email, :password, :password_confirmation, :name, :img_url)
  end
end
