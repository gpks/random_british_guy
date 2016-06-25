require_relative './lib/random_british_guy_fetcher'
require 'sinatra/static_assets'

class RandomBritishGuy < Sinatra::Base
  get '/' do
    @random_guy = RandomBritishGuyFetcher.new.final_url
    erb :index
  end

  helpers do
    def img(name)
      "<img src='#{name}' alt='Randon british guy' />"
    end
  end
end
