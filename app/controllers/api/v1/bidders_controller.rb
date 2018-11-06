class Api::V1::BiddersController < ApplicationController
  def index
    @bidders = Bidder.all
    render json: @bidders
  end

  def show
    @bidder = Bidder.find(params[:id])
    render json: @bidder
  end

  def create
    @bidder = Bidder.new(bidder_params)

    if @bidder.save
      render json: @bidder, status: :created
    else
      render json: @bidder.errors, status: :unprocessable_entity
    end
  end

  def update
    @bidder = Bidder.find(params[:id])
    if @bidder.update(bidder_params)
      render json: @bidder
    else
      render json: @bidder.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @bidder = Bidder.find(params[:id])
    @bidder.destroy
  end

  private

  def bidder_params # strong params
    params.require(:bidder).permit(:email, :password, :password_confirmation, :name)
  end
end
