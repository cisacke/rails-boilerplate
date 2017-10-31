class StaticPagesController < ApplicationController
  # before_action :require_signed_in!
  def root
    @is_signed_in = is_signed_in?
    @photo = Photo.new
    @photos = Photo.all.order({ created_at: :desc })
    @user = User.new
    render :index
  end
end
