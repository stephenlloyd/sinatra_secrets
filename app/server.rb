require 'sinatra/base'
require './sinatra/secrets'

ENV['RACK_ENV'] = 'development'

class MyApp < Sinatra::Base

  register Sinatra::Secrets

  # this would be nice
  set :secrets_dir, "/config"

  get '/' do
    p settings.secrets_dir
    Sinatra::Secrets.twilio_key
  end
end