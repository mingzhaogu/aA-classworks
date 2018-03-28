# @party.guests
# @guests

json.extract! @party, :name

json.guests @party.guests do |guest|
  json.name guest.name
  json.gifts do
    json.array! guest.gifts, :title, :description
  end
end
