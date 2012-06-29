class PublicImagesController < ApplicationController
  def index
    @listing = Widget.where('banned = ?', true)

    render json: @listing
  end
end