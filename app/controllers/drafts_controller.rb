class DraftsController < ApplicationController
  
  def index
    @entries = Entry.drafts_page
    
    respond_to do |format|
      format.html
      format.atom { render :layout => false }
    end
    
  end
  
end
