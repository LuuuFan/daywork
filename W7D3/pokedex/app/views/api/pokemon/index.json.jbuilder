@pokemons.each { |pokemon|
  json.set! pokemon.id do
    json.extract! pokemon, :id, :name
    json.set! :image_url, image_path(pokemon.image_url)
  end
}
