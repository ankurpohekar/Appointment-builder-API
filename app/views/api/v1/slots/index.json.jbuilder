json.code 200
json.slots @slots do |slot|
  json.id slot.id
  json.name slot.name
  json.start_time slot.start_time
end