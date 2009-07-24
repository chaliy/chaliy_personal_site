class DraftsController < ApplicationController
  
  def index
    @entries = Entry.drafts_page
  end

end
