json.code 200
json.message @message
json.signup do
  json.name @user.name
  json.email @user.email
end