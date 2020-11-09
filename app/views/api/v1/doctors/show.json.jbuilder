json.code 200
json.doctor @doctors.each do |d|
  json.doctor d.dname
  json.date d.date
  json.time d.start_time
end