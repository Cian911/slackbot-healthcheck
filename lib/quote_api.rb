require 'open-uri'

class QuoteApi

  def self.parse
    request_uri = 'http://quotes.rest/qod.json?category=life&api_key=' + ENV['QUOTE_API_KEY']
    result = "#{request_uri}"
    buffer = open(result).read
    response = JSON.parse(buffer)
    quote = response['contents']['quotes']
    
    return quote[0]['quote']
  end

end