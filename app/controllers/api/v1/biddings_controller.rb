class Api::V1::BiddingsController < ApplicationController
  def index
    @biddings = Bidding.all
    render json: @biddings
  end

  def create
    @bidding = Bidding.new(bidding_params)

    if @bidding.save
      render json: @bidder, status: :created
    else
      render json: @bidder.errors, status: :unprocessable_entity
    end
  end

  def update
    @bidding = Bidding.find(params[:id])
    if @bidding.update(bidding_params)
      render json: @bidding
    else
      render json: @bidding.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @bidding = Bidding.find(params[:id])
    @bidding.destroy
  end

  private
  def bidding_params
    params.require(:bidding).permit(:art_id, :bidder_id, :bid_amount)
  end
end
