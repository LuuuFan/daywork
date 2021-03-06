

json.set! :pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type
  json.set! :image_url, asset_path(@pokemon.image_url)
  json.set! :item_ids, @pokemon.items.pluck(:id)
end

json.set! :items do
  @pokemon.items.each {|item|
    json.set! item.id do
      json.extract! item, :id, :name, :pokemon_id, :price, :happiness
      json.set! :image_url, asset_path(item.image_url)
    end
  }
end
