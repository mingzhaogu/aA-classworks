class Api::PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.all
    render :index
  end

  def show
    @pokemon = Pokemon.includes(:items).find(params[:id])
    @items = @pokemon.items
    render :show
  end
end
