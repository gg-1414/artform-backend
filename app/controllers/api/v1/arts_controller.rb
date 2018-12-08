class Api::V1::ArtsController < ApplicationController
  def index
    @arts = Art.order(:id)
    render json: @arts
  end

  def show
    @art = Art.find(params[:id])
    render json: @art
  end

  def

  def create
    @art = Art.new(art_params)

    if @art.save
      render json: @art, status: :created
    else
      render json: @art.errors, status: :unprocessable_entity
    end
  end

  def update
    # start time default to 0
    @art = Art.find(params[:id])
    if @art.update(art_params)
      render json: @art
    else
      render json: @art.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @art = Art.find(params[:id])
    @art.destroy
  end


  def winner
    @art = Art.find(params[:id])
    if @art.update(winner_id:params[:winner_id])
      render json: @art
    else
      render json: @art.errors, status: :unprocessable_entity
    end
  end

  private

  def art_params # strong params
    params.require(:art).permit(:artist_id, :title, :starting_price, :img_url, :start_time, :winner_id)
  end

end
