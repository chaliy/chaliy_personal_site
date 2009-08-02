ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => "home"
  
  map.blog 'blog/', :controller => 'blog', :action => 'index'
  map.blog_drafts 'blog/drafts', :controller => 'blog', :action => 'drafts'
  map.blog_atom 'blog.atom', :controller => 'blog', :action => 'index', :format => 'atom'    
  map.blog_entry 'blog/:year/:month/:name', :controller => 'blog', :action => 'entry'
   
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
   
end
