require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero.erb
    end

    post '/teams' do
      erb :team.erb
    end

end
