class HomeController < ApplicationController
  layout nil
  
  def index
    @entries = Entry.find(:all)
  end

end
