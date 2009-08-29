class HomeController < ApplicationController
  layout nil
  
  def index
    @entries = Entry.page(:published)
  end
  
  def sitemap
    @published_entries = Entry.page(:published)
    @draft_entries = Entry.page(:drafts)
  end

end
