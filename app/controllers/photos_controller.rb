class PhotosController < ApplicationController
  before_action :set_photo, only: [:destroy]
  def create
    if !params[:photo]
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
        return
      end
    end
    @photo = Photo.new(photo_params)
    @photo.user = currently_signed_in

    respond_to do |format|
      if @photo.save
        format.html { redirect_to root_url }
      else
        format.js
        return
      end
    end
  end

  def destroy
    @photo.destroy
    redirect_to root_url
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:image)
  end
end
