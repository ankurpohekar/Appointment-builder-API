module ApiHelper

  def json
    JSON.parse(response.body)
  end

  def authenticated_header(request, user)
    post '/api/v1/account/signin', params: {signin: {email: user.email, password: '123123123'}}
    return json["signin"]["access_token"]
  end
end