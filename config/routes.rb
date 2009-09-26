ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => "home"
  
  map.sitemap 'sitemap.xml', :controller => 'home', :action => 'sitemap', :format => 'xml'
  
  # old links
  map.connect '/Sources/UpdatableXmlDataSource/Default.aspx', :controller => 'sources', :action => 'outdated'   
  
  # blog
  # redirected posts
  map.blog 'blog/', :controller => 'blog', :action => 'index'
  map.blog_drafts 'blog/drafts', :controller => 'blog', :action => 'drafts'
  map.blog_atom 'blog.atom', :controller => 'blog', :action => 'index', :format => 'atom'
  map.blog_rss 'blog.rss', :controller => 'blog', :action => 'index', :format => 'rss'
  map.blog_drafts_atom 'blog_drafts.atom', :controller => 'blog', :action => 'drafts', :format => 'atom'
  map.blog_entry 'blog/:year/:month/:name',
    :controller => 'blog',
    :action => 'entry',
    :year => /\d{4}/,
    :month => /\d{1,2}/  

   
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
   
end
