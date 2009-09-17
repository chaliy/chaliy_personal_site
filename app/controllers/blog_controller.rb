class BlogController < ApplicationController
  
  def index
    entries(:published)       
  end
  
  def drafts        
    entries(:drafts)    
  end
  
  def entry
    
    @entry = Entry.find(params[:year], params[:month], params[:name]);
    @title = @entry.title 
    
  end
  
  private
  def entries(t)
    @entries = Entry.page(t)
    
    respond_to do |format|
      format.html
      format.atom { render :layout => false }
    end
  end
  
end
