class ArtworksController < ApplicationController

  def index
    artworks = Artwork.find_by(artist_id: params[:user_id])
    shared_with_user = ArtworkShare.find_by(viewer_id: params[:user_id])
    render json: shared_with_user AND artworks
  end

  def create
    artwork = Artwork.new(artwork_params)

    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def show
    artwork = Artwork.find_by(id: params[:id])

    if artwork
      render json: artwork
    else
      redirect_to '/artworks/'
    end
  end

  def update
    artwork = Artwork.find(params[:id])

    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy

    redirect_to '/artworks/'
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
