json.pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense

  json.moves do
    json.array! @pokemon.moves
  end

  json.extract! @pokemon, :poke_type
  json.image_url asset_path(@pokemon.image_url)

  json.item_ids do
    json.array! @items.map{ |item| item.id }
  end
end

json.items do
  @items.each do |item|
    json.set! item.id do
      json.extract! item, :id, :name, :pokemon_id, :price, :happiness
      json.image_url asset_path(item.image_url)
    end
  end
end
