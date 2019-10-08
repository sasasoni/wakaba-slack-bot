require 'httpclient'
require 'uri'

class Translator
  def initialize
    @http = HTTPClient.new
  end

  def translate(text)
    encoded_text = URI.encode(text)
    json = @http.get("https://script.google.com/macros/s/AKfycbyqHVJj7mOrbso9j2R7af3ISBd79F_k54nQebiX288OtZglNb8/exec?q=#{encoded_text}",
                      follow_redirect: true).body
    JSON.parse(json)["body"]
  end
end