class Api::V1::PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :update, :destroy]

  # GET /pokemons
  def index
    @pokemons = Pokemon.all
    render json: @pokemons
  end

  # GET /pokemons/:{id}
  def show
      render json: @pokemon, serializer: PokemonDetailedSerializer
  end

  # POST /pokemons
  def create
    @pokemon = Pokemon.new(pokemon_params)

    if params[:types].present?
      types = Type.where(id: params[:types])
      @pokemon.types << types
    end
    
    if @pokemon.save
      render json: @pokemon, status: :created
    else
      render json: { :errors => @pokemon.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemons/1
  def update
    if params[:types]
      updatedTypes = Type.where(id: params[:types])
      @pokemon.types.delete_all
      @pokemon.types << updatedTypes
    end
    
    if @pokemon.update(pokemon_params)
      render json: @pokemon 
    else
      render json: { :errors => @pokemon.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /pokemons/1
  def destroy
    @pokemon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pokemon_params
      params.require(:pokemon).permit(:name, :sprite_front_url, :api_url, :evolves_from, :types)
    end
end
