
load './config/initializers/google_cse_api.rb'

class RandomBritishGuyFetcher
  attr_reader :result, :items, :links, :q, :randomizer
  GUYS = ["David Tennant", "Idris Elba", "Tom Hiddleston", "benedict cumberbatch"].freeze
  def final_url
    links[randomizer.rand(10)]
  end

  private

  def produce_url
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
    @result ||= HTTParty.get(produce_url, verify: false)
  end

  def items
    @items ||= result.parsed_response['items']
  end

  def links
    @links ||= items.map { |item| item.fetch("link") }
  end
end
