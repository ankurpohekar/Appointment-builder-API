json.code 200
json.message @message
json.appointment do 
  json.id @appoint.id
  json.doctor @appoint.dname
  json.date @appoint.date
  json.time @appoint.start_time
end