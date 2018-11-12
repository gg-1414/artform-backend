class Api::V1::ArtistsAuthController < ApplicationController
  def create
    @artist = Artist.find_by(email: params[:email])

    if @artist && @artist.authenticate(params[:password])
      token = issue_token(jwt: @artist.id)
      render json: {jwt: token, email: @artist.email, name: @artist.name, img_url: @artist.img_url}
    else
      render json: {error: 'User is invalid'}, status: :unauthorized
    end
  end

  def show
    token = request.headers["Authorization"]
    decoded_token = decode_token(token)
    # byebug
    @artist = Artist.find(decoded_token[0]["jwt"])
    render json: {id: @artist.id, email: @artist.email, name: @artist.name, img_url: @artist.img_url}
  end
end
