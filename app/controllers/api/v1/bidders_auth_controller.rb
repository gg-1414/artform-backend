class Api::V1::BiddersAuthController < ApplicationController
  def create
    @bidder = Bidder.find_by(email: params[:email])

    if @bidder && @bidder.authenticate(params[:password])
      token = issue_token(jwt: @bidder.id)
      render json: {jwt: token, email: @bidder.email, name: @bidder.name}
    else
      render json: {error: 'User is invalid'}, status: :unauthorized
    end
  end

  def show
    token = request.headers["Authorization"]
    decoded_token = decode_token(token)
    # byebug
    @bidder = Bidder.find(decoded_token[0]["jwt"])
    render json: @bidder
  end
end
