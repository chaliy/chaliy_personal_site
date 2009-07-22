class DraftsController < ApplicationController
  
  def index
    @entries = Draft.page
  end

end
