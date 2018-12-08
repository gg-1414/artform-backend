class Api::V1::BiddersAuthController < ApplicationController
  def create
    @bidder = Bidder.find_by(email: params[:email])
    # byebug
    if @bidder && @bidder.authenticate(params[:password])
      token = issue_token(jwt: @bidder.id)
      render json: {id: @bidder.id, jwt: token, email: @bidder.email, name: @bidder.name}
    else
      # byebug
      render json: {error: 'User is invalid'}, status: :unauthorized
    end
  end

  def show
    # byebug
    token = request.headers["Authorization"]
    decoded_token = decode_token(token)
    @bidder = Bidder.find(decoded_token[0]["jwt"])
    render json: {id: @bidder.id, email: @bidder.email, name: @bidder.name}
  end
end
