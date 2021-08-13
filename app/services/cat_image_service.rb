# frozen_string_literal: true

class CatImageService
  def self.get_image
    JSON.parse(request.body)[0]['url']
  end

  def self.query
    params = { size: 'med' }
    uri = URI('https://api.thecatapi.com/v1/images/search')
    uri.query = URI.encode_www_form(params)
    uri
  end

  def self.header
    request = Net::HTTP::Get.new(query)
    request['x-api-key'] = ENV['CAT_API_KEY']
    request
  end

  def self.request
    Net::HTTP.start(query.hostname, query.port, use_ssl: true) do |http|
      http.request(header)
    end
  end
end
