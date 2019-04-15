# Pokedex API

![Galerinha Reunida](https://pbs.twimg.com/media/DlqJGt3W4AAHZCY.jpg)
[Galerinha Reunida - Paulo Moreira](https://twitter.com/paulomoreria/status/1034290406622683136)

## Configuração

Crie os bancos: pokedex e pokedex_teste

Não esqueça de instlar as dependencias:
```
bundle install
```

Migre o database schema:
```
rails db:migrate
```

O seed faz mining da PokeAPI:
```
rails db:seed
```

## Testes

Os testes utilizam o Rspec:

```
bundle exec rspec
```

## Endpoints

```GET {host}/api/v1/pokemons``` 

Busca todos os pokemons, sem suas evoluções.

Exemplo de resposta:

``` 
[
    {
        "id": 48,
        "name": "primeape",
        "sprite_front_url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/57.png",
        "api_url": "https://pokeapi.co/api/v2/pokemon/primeape",
        "evolves_from": 131
    },
    {
        "id": 51,
        "name": "dugtrio",
        "sprite_front_url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/51.png",
        "api_url": "https://pokeapi.co/api/v2/pokemon/dugtrio",
        "evolves_from": 134
    },
    ...
]
```

```GET {host}/api/v1/pokemons/:id``` 

Busca pokemon por identificador:

Exemplo de resposta:

```
{
    "id": 150,
    "name": "charmander",
    "sprite_front_url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png",
    "api_url": "https://pokeapi.co/api/v2/pokemon/charmander",
    "types": [
        {
            "id": 9,
            "name": "fire"
        }
    ],
    "evolves_from": null,
    "evolutions": [
        {
            "id": 81,
            "name": "charmeleon",
            "sprite_front_url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png",
            "api_url": "https://pokeapi.co/api/v2/pokemon/charmeleon",
            "types": [
                {
                    "id": 9,
                    "name": "fire"
                }
            ],
            "evolves_from": 150,
            "evolutions": [
                {
                    "id": 80,
                    "name": "charizard",
                    "sprite_front_url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png",
                    "api_url": "https://pokeapi.co/api/v2/pokemon/charizard",
                    "types": [
                        {
                            "id": 3,
                            "name": "flying"
                        },
                        {
                            "id": 9,
                            "name": "fire"
                        }
                    ],
                    "evolves_from": 81,
                    "evolutions": []
                }
            ]
        }
    ]
}
```

```POST {host}/api/v1/pokemons```

|param|tipo|obrigatorio
|-|-|-|
|name|string|sim|
|types|array de inteiros|não
|sprite_front_url|string|não
|api_url|string|não
|evolves_from|array de inteiros|não

Exemplo de body: 
```
    "name": "dragonair",
    "sprite_front_url": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/148.png",
    "api_url": "https://pokeapi.co/api/v2/pokemon/dragonair",
    "types": [1, 2, 3],
    "evolves_from": 86,
``` 

```PUT/PATCH {host}/api/v1/pokemons/:id```

|param|tipo|obrigatorio
|-|-|-|
|name|string|não - porém não é nulo/vazio|
|types|array de inteiros|não
|sprite_front_url|string|não
|api_url|string|não
|evolves_from|array de inteiros|não

Exemplo de body: 
```
    "api_url": "https://pokeapi.co/api/v2/pokemon/dragonair",
    "types": [1, 2, 3],
    "evolves_from": 86,
``` 

```DELETE {host}/api/v1/pokemons/:id```

Apaga o pokemon via id.

```GET {host}/api/v1/types``` 

Busca todos os tipos de Pokémons.
