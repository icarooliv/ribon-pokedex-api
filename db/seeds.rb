
@api_calls = 0

@base_url = 'https://pokeapi.co/api/v2/'

def request(endpoint)
        response = RestClient::Request.execute(
        method: :get,
        url: @base_url + endpoint)
    case response.code
    when 200
        puts 'Sucessfull API call n '
        puts @api_calls += 1
        return JSON.parse(response)
    else 
        raise Exception.new('something bad happened!')
    end
end

generations_body = request('generation/1')

# create types
puts 'Populating types'
generations_body["types"].map { |type| Type.create(name: type["name"]) }

# gets names from generations and creates pokemons
puts 'Populating pokemons'
pokemons_names = generations_body["pokemon_species"].map { |pokemon_url| pokemon_url["name"] }
pokemons_names.map {|name| Pokemon.create(name: name)}

# populates ancestors
puts 'Populating evolutions'
pokemons_names.each do |name|
    body = request('pokemon-species/' + name)
    ancestor_name = body["evolves_from_species"]["name"] rescue nil
    if ancestor_name.present?
        if @poke_ancestor = Pokemon.where(name: ancestor_name).first
            if @poke_actual = Pokemon.where(name: name).first
                @poke_actual.evolves_from = @poke_ancestor.id
                @poke_actual.save
            end
        end
    end
end

puts 'Populating pokemons_types and additional data'
# populates pokemon_types
pokemons_names.each do |name|
    endpoint = ('pokemon/' + name)
    
    body = request(endpoint)
    
    @pokemon = Pokemon.where(name: name).first
    @pokemon.sprite_front_url = body["sprites"]["front_default"]
    @pokemon.api_url = @base_url + endpoint
    
    types_array = body["types"].map {| type | type["type"]["name"]}
    types = Type.where(name: types_array)
    
    @pokemon.types << types
    @pokemon.save
end