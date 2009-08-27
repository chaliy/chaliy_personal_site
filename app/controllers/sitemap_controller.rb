require "builder"

class SitemapController < ApplicationController
  layout nil
  
  def index
    #@entries = Entry.page(:published)    
    xml = Builder::XmlMarkup.new
    render :xml => xml
  end

end
