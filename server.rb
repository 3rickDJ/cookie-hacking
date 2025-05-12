require 'sinatra'

set :bind, ENV.fetch('HOST', 'localhost')
set :port, ENV.fetch('PORT', 4567)
# this env is automatically set by ruby? idk, but it is
# set :environment, ENV.fetch('APP_ENV', :development).to_sym
if ENV['APP_ENV'] == 'production'
  p "Running in production mode"
  set :host_authorization, { permitted_hosts: ENV.fetch("ALLOWED_HOSTS").split(",") }
else
  p "Running in #{settings.environment} mode"
  p "Allowed hosts: #{settings.host_authorization[:permitted_hosts].inspect}"
end


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
