json.appointment @appointments.each do |appointment|
  json.id appointment.id
  json.date appointment.date
end