class Api::V1::ArtTagsController < ApplicationController

  def index
    @messages =  Message.all
    render :json @messages
  end


  def show
    @message = Message.find(params[:id])
  end


  private

  def message_params
    params.require(:message).permit(:bidder_id,:message)
  end
end
