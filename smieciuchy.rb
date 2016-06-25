#     # AIzaSyAcDp7FJC8NjLPjFuwQiJKwEGGhG4TlcKw
#     # HTTParty.get("http://www.googleapis.com/customsearch/v1?q=tom+hiddleston&cx=016031641982053929523%3Avcwcaxcnkhq&searchType=image&key=AIzaSyAcDp7FJC8NjLPjFuwQiJKwEGGhG4TlcKw")
#     path = "https://www.googleapis.com/customsearch/v1?q=tom+hiddleston&cx=016031641982053929523%3Avcwcaxcnkhq&searchType=image&key=AIzaSyAcDp7FJC8NjLPjFuwQiJKwEGGhG4TlcKw"
#     uri = URI(path)
# # response = Net::HTTP.start(uri.host, uri.port) do |http|
# #   request = Net::HTTP::Get.new uri.request_uri
# #   http.request request # Net::HTTPResponse object
# # end
# # puts response.body
#  connection = Excon.new(path)
# get_response = connection.get
# puts get_response
# # UPDATE: You need to include that library like this:
#   end
