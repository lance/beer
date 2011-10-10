require 'rubygems'
require 'sinatra/base'

require 'haml'
require 'sass'

require 'beer'
require 'auth'

module BeerCatalogue

  class Application < Sinatra::Base

    enable :sessions, :logging, :static, :method_override
    
    include BeerCatalogue::Authentication

    before '/login' do
      skip_authentication
    end

    before '/styles.css' do
      skip_authentication
    end

    before do
      require_authentication
    end

    get '/' do
      @beers = Beer.all(:user_id => current_user.id)
      haml :index
    end

    put '/beer/:id' do
      do_update
      redirect '/'
    end

    delete '/beer/:id' do
      do_delete
      content_type :json
      "{\"id\": #{params[:id]}}"
    end

    post '/beer' do
      attrs = params[:beer] || {}
      attrs[:user_id] = current_user.id
      beer = Beer.create( attrs )
      redirect '/'
    end

    get '/login' do
      haml :login
    end

    post '/login' do
      authenticate(params[:username], params[:password]) && redirect('/') || haml(:login)
    end

    get '/logout' do
      logout
      redirect '/login'
    end

    get '/styles.css' do
      scss :styles
    end
    
    private
    def do_update
      beer = Beer.first(:user_id => current_user.id, :id => params[:id])
      beer.update( params[:beer] ) if beer
      beer.save
    end

    def do_delete
      beer = Beer.get(params[:id])
      puts "Can't find a beer with that id. Sorry." and return unless beer
      beer.destroy
    end

  end
end


