require 'httpclient'
http = HTTPClient.new
puts http.get("https://script.google.com/macros/s/AKfycbyqHVJj7mOrbso9j2R7af3ISBd79F_k54nQebiX288OtZglNb8/exec?q=let it be", :follow_redirect => true).body