require 'rest-client'

class CatApi
  def self.getImg
    response = RestClient::Request.execute(method: :get, url: 'https://api.thecatapi.com/v1/images/search')
    JSON.parse(response.body)[0]['url']
  end
end
