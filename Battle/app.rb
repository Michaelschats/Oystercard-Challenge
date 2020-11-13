require 'sinatra/base'
require_relative './lib/Player.rb'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/player_names' do
    p $player_1 = Player.new(params[:Player_1_name])
    p $player_2 = Player.new(params[:Player_2_name])
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  get '/attack' do
    p @player_1_name = $player_1.name
    p @player_2_name = $player_2.name
    erb :attack
  end
end
