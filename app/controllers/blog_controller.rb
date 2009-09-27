require 'models/entry'
require File.dirname(__FILE__) + '../../../lib/entry_store'

class BlogController < ApplicationController
  
  def index
    entries(:published)       
  end
  
  def drafts        
    entries(:drafts)    
  end
  
  def entry
    
    @entry = EntryStore::Index.find(params[:year], params[:month], params[:name]);
    
    # handle moved post...
    if @entry == nil
      possibleEntry = EntryStore::Index.findByName(params[:name])
      if possibleEntry != nil
        newUrl = blog_entry_url(:name => possibleEntry.name, :year => possibleEntry.published_on.year, :month => possibleEntry.published_on.month)
        redirect_to newUrl, :status=>:moved_permanently
      end
    end
        
  end
     
  private
  def entries(t)
    @entries = EntryStore::Index.page(t)
    
    respond_to do |format|
      format.html
      format.atom { render :layout => false }
      format.rss { render :layout => false }
    end
  end
  
end
