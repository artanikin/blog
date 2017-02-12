class Admin::PicturesController < ApplicationController
  def create
    @picture = Picture.new(image_params)
    @picture.save
    respond_to do |format|
      format.json { render :json => { url: @picture.image.url(:large), picture_id: @picture.id } }
    end
  end

  def destroy
    picture = Picture.find(params[:id])
    picture.destroy
    respond_to do |format|
      format.json { render json: { status: :ok } }
    end
  end

  private

  def image_params
    params.require(:picture).permit(:image)
  end
end
