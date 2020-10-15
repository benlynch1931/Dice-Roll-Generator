require 'sinatra'


class DiceGenerator < Sinatra::Application
  enable :sessions
  set :session_secret, ENV["SESSION_SECRET"]

  get '/' do
    erb :index
  end

  post '/one_die' do
    session[:num1] = rand(1..6)
    redirect '/one_die_view'
  end

  get '/one_die_view' do
    @random_dice_1 = session[:num1]
    erb :one_die
  end

  post '/two_dice' do
    session[:num1] = rand(1..6)
    session[:num2] = rand(1..6)
    redirect '/two_dice_view'
  end

  get '/two_dice_view' do
    @random_dice_1 = session[:num1]
    @random_dice_2 = session[:num2]
    @total = @random_dice_1 + @random_dice_2
    erb :two_dice
  end

  post '/three_dice' do
    session[:num1] = rand(1..6)
    session[:num2] = rand(1..6)
    session[:num3] = rand(1..6)
    redirect '/three_dice_view'
  end

  get '/three_dice_view' do
    @random_dice_1 = session[:num1]
    @random_dice_2 = session[:num2]
    @random_dice_3 = session[:num3]
    @total = @random_dice_1 + @random_dice_2 + @random_dice_3
    erb :three_dice
  end


  run! if app_file == $0
end
