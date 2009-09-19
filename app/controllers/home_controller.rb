class HomeController < ApplicationController
  
  def index
    @entries = Entry.page(:published)
    
    render :layout => false
  end
  
  def sitemap
    @published_entries = Entry.page(:published)
    @draft_entries = Entry.page(:drafts)
    
    render :layout => false   
  end
    
  def contacts    
  end
    
end
