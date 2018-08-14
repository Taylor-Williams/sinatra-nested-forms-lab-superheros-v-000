require 'sinatra/base'
require_relative '../models/hero.rb'
require_relative '../models/team.rb'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      Team.new(params[:team])
      @team = Team.all.first
      params[:team][:heroes].each do |hero|
        Hero.new(hero)
      end
      @heroes = Hero.all
      erb :team
    end

end
