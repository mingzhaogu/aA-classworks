
json.array! @guests do |guest|
  if guest.age.between?(40, 50)
    json.name guest.name
    json.age guest.age
    json.favorite_color guest.favorite_color
  else
    nil
  end
end
