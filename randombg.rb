require_relative './lib/random_british_guy_fetcher'
require 'sinatra/static_assets'

class RandomBritishGuy < Sinatra::Base
  get '/' do
    begin
      @random_guy = RandomBritishGuyFetcher.new.final_url
      erb :index
    rescue RandomBritishGuyFetcher::Error
      erb :error
    end
  end

  helpers do
    def img(name)
      "<img src='#{name}' alt='Randon british guy' />"
    end
  end
end
