require 'models/entry'
require 'lib/entry_store'

class HomeController < ApplicationController
  
  def index
    @entries = EntryStore::Index.page(:published)
    render :layout => false
  end
  
  def sitemap
    @published_entries = EntryStore::Index.page(:published)
    @draft_entries = EntryStore::Index.page(:drafts)
    
    render :layout => false   
  end
    
  def contacts    
  end
    
end
