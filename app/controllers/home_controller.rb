class HomeController < ApplicationController
  layout nil
  
  def index
    @entries = Entry.public_page
  end

end
