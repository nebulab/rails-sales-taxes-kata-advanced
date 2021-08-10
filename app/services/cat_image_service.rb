# frozen_string_literal: true

class CatImageService
  def self.get_image
    uri = URI('https://api.thecatapi.com/v1/images/search')
    request = Net::HTTP::Get.new(uri)
    request['x-api-key'] = ENV['CAT_API_KEY']
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end
    JSON.parse(response.body)[0]['url']
  end
end
