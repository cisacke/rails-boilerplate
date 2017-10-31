class UpvotesController < ApplicationController
  def create
    @upvote = Upvote.find_by(photo_id: params[:user][:photo], user_id: currently_signed_in.id)

    respond_to do |format|
      if @upvote
        return if @upvote.value == params[:user][:value]
        @upvote.update!(value: params[:user][:value])
        @photo = @upvote.photo
        format.js
      else
        @upvote = Upvote.new(
          photo_id: params[:user][:photo],
          user_id: currently_signed_in.id,
          value: params[:user][:value]
        )

        @photo = @upvote.photo
        @upvote.save!
        format.js
      end
    end
  end

  private

  def upvote_params
    params.require(:upvote).permit(:user, :photo, :value)
  end
end
