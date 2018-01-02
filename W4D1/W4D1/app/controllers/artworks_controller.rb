class ArtworksController < ApplicationController

  def index
    # artworks = Artwork.all
    # render json: artworks, status: 200
    # render json: params
    if params.has_key?(:artist_id)
      artworks = Artwork.where(artist_id: params[:artist_id])
    elsif params.has_key?(:viewer_id)
      artworks = Artwork.joins(:artworks_shares).where("artworks_shares.viewer_id = #{params[:viewer_id]}")
    else
      render plain: 'You do not have permission to see all the artworks'
    end
    render json: artworks
  end

  def show
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      render json: artwork, status: 200
    else
      render plain: 'Cannot find the artwork'
    end
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork, status: 200
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def update
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      if artwork.update(artwork_params)
        render json: artwork, status: 200
      else
        render json: artwork.errors.full_messages, status: 422
      end
    else
      render plain: 'Cannot find the artwork'
    end
  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      artwork.destroy
      # redirect_to artworks_url
      render json: Artwork.all
    else
      render plain: 'Cannot find the artwork'
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
