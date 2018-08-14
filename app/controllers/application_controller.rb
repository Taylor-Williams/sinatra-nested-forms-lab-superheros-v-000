require 'sinatra/base'
require_relative '../models/hero.rb'
require_relative '../models/team.rb'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      Team.new(name: params[:team][:name], motto: params[:team][:motto])
      @teams = Team.all
      params[:team][:heroes].each do |hero|
        Hero.new(name: hero[:name], power: hero[:power], bio: hero[:bio])
      end
      @heroes = Hero.all
      erb :team
    end

end
