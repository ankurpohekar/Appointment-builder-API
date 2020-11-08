json.signup do
  json.name @user.name
  json.email @user.email
end
json.message @message