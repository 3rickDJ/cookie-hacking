require 'sinatra'

# Route to set a cookie
get '/set' do
  response.set_cookie('username', value: 'Erick', path: '/', max_age: '2592000')  # 30 days
  "Cookie set! (username=Erick)"
end

get '/set2' do
  response.set_cookie('cuk2', value: '123', path: '/', max_age: '2592000')  # 30 days
  "Cookie set! (cuk2=123)"
end

# Route to get a cookie
get '/get' do
  username = request.cookies['username']
  if username
    "Hello again, #{username}!"
  else
    "No cookie found!"
  end
end

# Route to get a cookie
get '/get2' do
  cuk = request.cookies['cuk2']
  if cuk
    "Helo cuk, #{cuk}!"
  else
    "No cookie found!"
  end
end
