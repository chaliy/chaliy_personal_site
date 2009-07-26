class DraftsController < ApplicationController
  
  def index
    @entries = Entry.drafts_page
    
    respond_to do |format|
      format.html
      format.atom
    end
    
  end
  
  def atom
    
    @entries = Entry.drafts_page
    
    respond_to do |format|
      format.atom
    end
      
  end
  
end
