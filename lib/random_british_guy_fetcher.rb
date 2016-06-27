
load './config/initializers/google_cse_api.rb'

class RandomBritishGuyFetcher
  class Error < StandardError
  end
  attr_reader :result, :items, :links, :q, :randomizer, :final_url
  GUYS = ["David Tennant", "Idris Elba", "Tom Hiddleston", "benedict cumberbatch", "hugh grant", "toby stephens", "aidan turner", "colin firth"].freeze

  def final_url
    links[randomizer.rand(10)]
  end

  private

  def google_search_url
    "https://www.googleapis.com/customsearch/v1?q=#{q}&cx=#{GOOGLE_SEARCH_CX}&searchType=image&start=#{randomizer.rand(100)}&key=#{GOOGLE_API_KEY}"
  end

  def randomizer
    randomizer = Random.new
  end

  def q
    index = randomizer.rand(GUYS.count)
    guy = GUYS[index]
    guy.gsub(" ", "+")
  end

  def result
    begin
      @result ||= HTTParty.get(google_search_url, verify: false)
      raise RandomBritishGuyFetcher::Error if @result.parsed_response.fetch("error", nil)
      @result
    rescue
      puts "error"
      raise RandomBritishGuyFetcher::Error
    end
  end

  def items
    @items ||= result.parsed_response.fetch("items")
  end

  def links
    @links ||= items.map { |item| item.fetch("link") }
  end
end
