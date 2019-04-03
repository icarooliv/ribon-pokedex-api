class Api::V1::PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :update, :destroy]

  # GET /pokemons
  def index
    if params[:name].present?
      @pokemon = Pokemon.find_by_name!(params[:name])
      render json: @pokemon
    else 
      @pokemons = Pokemon.all
    render json: @pokemons
    end
  end

  # GET /pokemons/:{id}
  def show
    data = @pokemon.all_children 
    render json: {data: data[0]}
  end

  # POST /pokemons
  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      render json: @pokemon, status: :created
    else
      render json: {errors: "Unprocessable entity"}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pokemons/1
  def update
    if @pokemon.update(pokemon_params)
      render json: @pokemon
    else
      render json: {errors: "Unprocessable entity"}, status: :unprocessable_entity
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
      params.require(:pokemon).permit(:name, :profile_url, :level, :evolves_from)
    end
end
