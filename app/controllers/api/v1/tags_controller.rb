class Api::V1::TagsController < ApplicationController
  def index
    @tags = Tag.all
    render json: @tags
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render json: @tag, status: :created
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
  end

  def search
    @tag = Tag.find_by(name: params[:tag])
    if @tag
      @arts = @tag.arts
      render json: @arts
    else
      @arts = Art.all
      render json: @arts
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
