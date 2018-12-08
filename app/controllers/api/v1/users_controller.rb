class Api::V1::UsersController < ApplicationController
  def create
    if params[:typeOf] === 'Artist' do
      @user = Artist.find_by(email: params[:email])

      if @user && @user.authenticate(params[:password])
        token = issue_token(jwt: @user.id)
        render json: {jwt: token, email: @user.email, name: @user.name, img_url: @user.img_url}
      else
        render json: {error: 'User is invalid'}, status: :unauthorized
      end

    else
      @user = Bidder.find_by(email: params[:email])

      if @user && @user.authenticate(params[:password])
        token = issue_token(jwt: @user.id)
        render json: {jwt: token, email: @user.email, name: @user.name}
      else
        render json: {error: 'User is invalid'}, status: :unauthorized
      end
    end
  end

  def show
    token = request.headers["Authorization"]
    decoded_token = decode_token(token)
    if Bidder.find(decoded_token[0]["jwt"])
      @user = Bidder.find(decoded_token[0]["jwt"])
      render json: {id: @user.id, email: @user.email, name: @user.name}
    elsif Artist.find(decoded_token[0]["jwt"])
      @user = Artist.find(decoded_token[0]["jwt"])
      render json: {id: @artist.id, email: @artist.email, name: @artist.name, img_url: @artist.img_url}
    end 
  end
end
