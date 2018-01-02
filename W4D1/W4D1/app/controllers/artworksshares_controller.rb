class ArtworkssharesController < ApplicationController

  def create
    artworkshare = ArtworksShare.new(artworkshare_params)
    if artworkshare.save
      render json: artworkshare, status: 200
    else
      render json: artworkshare.errors.full_messages, status: 422
    end
  end

  def destroy
    artworkshare = ArtworksShare.find_by(id: params[:id])
    if artworkshare
      if artworkshare.destroy
        render json: ArtworksShare.all, status: 200
      else
        render json: artworkshare.erros.full_messages, status: 422
      end
    else
      render plain: 'Sharing doesnot exist'
    end
  end

  private
  def artworkshare_params
    params.require(:artworksshare).permit([:artwork_id, :viewer_id])
  end

end
