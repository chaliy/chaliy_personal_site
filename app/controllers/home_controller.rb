class HomeController < ApplicationController
  layout nil
  
  def index
    @entries = Entry.page(:published)
  end

end
