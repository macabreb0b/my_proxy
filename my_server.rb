require 'webrick'
require 'open-uri'
require 'nokogiri'
require 'lrucache'

server = WEBrick::HTTPServer.new Port: 8080

# set max size of number of items, not memory
$cache = LRUCache.new(:max_size => 50)

# handle request callback
server.mount_proc '/' do |req, res|
  url = req.request_uri.to_s
  
  # if key exists in hash, serve this
  if $cache[url]
    html_body = $cache[url]
    if html_body.include?("</head>")
      html_body = html_body.gsub("</head>", "</head>This is a cached item<br>")
    end
    
    puts "serving cached item"
  else
    # if it doesn't exist, make GET request
    # then set response body to the HTML string
    html_body = Nokogiri::HTML(open(url)).to_s
    $cache[url] = html_body
    
    puts "caching item"
    puts "cache size: #{$cache.size}"
  end
  
  res.body = html_body
end

trap 'INT' do server.shutdown end

server.start