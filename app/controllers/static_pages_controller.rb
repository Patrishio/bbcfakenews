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
    # params[:title]    
    # params[:desc]      
    # params[:link]    
    # params[:pubDate]    

  end
end
