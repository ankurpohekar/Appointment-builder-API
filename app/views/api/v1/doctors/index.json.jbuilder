json.code 200
json.doctors @doctors do |doctor|
  json.id doctor.id
  json.name doctor.name
end