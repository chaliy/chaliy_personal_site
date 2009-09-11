class SourcesController < ApplicationController
  
  def outdated
        
    redirect_to "/blog/2009/9/my_old_old_projects", :status=>:moved_permanently
    
  end
   
end