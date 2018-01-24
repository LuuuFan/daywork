

json.set! :pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type, :image_url
  json.set! :item_ids, @pokemon.items.pluck(:id)
end

json.set! :items do
  @pokemon.items.each {|item|
    json.set! item.id do
      json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
    end
  }
end
