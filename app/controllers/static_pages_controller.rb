class StaticPagesController < ApplicationController
  
  # -----------------------------
  def home    
    require 'rss'
    
    # ---------------- 
    # if app become complex it can be move to the service PORO object
    feed = RSS::Parser.parse(open('http://newsrss.bbc.co.uk/rss/newsonline_uk_edition/front_page/rss.xml').read, false)    
    @items = feed.items
  end

  # -----------------------------
  def vote_action
    uri = URI("http://localhost:3000/api/feeds/update_xml")
    http = Net::HTTP.new(uri.host, uri.port)
    http.read_timeout = 2
    request = Net::HTTP::Get.new(uri.request_uri)    
    request['Content-Type'] = "application/json" 
    request.body = {
      "title": params[:title], 
      "desc": params[:desc],
      "link": params[:link],
      "pub_date": params[:pubDate]
    }.to_json    
    response = http.request(request)      
    
    puts "#{response}"
    # ----------------------
    # here cound be done showing respone error to user
  end
end
