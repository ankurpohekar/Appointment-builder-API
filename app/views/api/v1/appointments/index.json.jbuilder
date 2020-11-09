json.code 200
json.appointment @appointments.each do |appointment|
  json.id appointment.id
  json.name appointment.uname
  json.email appointment.uemail
  json.doctor appointment.dname
  json.date appointment.date
  json.time appointment.start_time
end