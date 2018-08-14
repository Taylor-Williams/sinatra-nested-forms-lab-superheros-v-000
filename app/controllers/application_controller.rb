require 'sinatra/base'
require_relative '../models/hero.rb'
require_relative '../models/team.rb'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/teams' do
      puts params[:team].map{|k,v| "#{k}: #{v}" unless v.is_a?(Array)}.join(", ")
      Team.new(params[:team].map{|k,v| "#{k}: #{v}"}.join(", "))
      @teams = Team.all
      params[:team][:heroes].each do |hero|
        Hero.new(hero.map{|k,v| "#{k}: #{v}"}.join(", "))
      end
      @heroes = Hero.all
      erb :team
    end

end
