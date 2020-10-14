require 'sinatra'

class DiceGenerator < Sinatra::Application

  get '/' do
    erb :index
  end
end
