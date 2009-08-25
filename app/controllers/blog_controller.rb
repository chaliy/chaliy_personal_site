class BlogController < ApplicationController
  
  def index
    @entries = Entry.page(:published)
    
    respond_to do |format|
      format.html
      format.atom { render :layout => false }
    end
    
  end
  
  def drafts
    
    @entries = Entry.page(:drafts)
    
    respond_to do |format|
      format.html
      format.atom { render :layout => false }
    end
    
  end
  
  def entry
    
    @entry = Entry.find(params[:year], params[:month], params[:name]);
    @title = @entry.title 
    
  end
  
end
