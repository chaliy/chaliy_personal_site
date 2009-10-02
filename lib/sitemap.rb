module Sitemap
  
  class Urlset
    
    
    
    def initialize(urls = [])
                       
      @urls = urls
      
    end
        
    def url(url, options = {})
      
      u = options.clone
      u[:loc] = url
      
      @urls << u
           
    end
    
    def builder
      
      @xml = Builder::XmlMarkup.new
      @xml.instruct!
      
      @xml.urlset(:xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9") {
      
        for url in @urls
      
          @xml.url {
            @xml.loc(url[:loc])            
            @xml.lastmod(url[:lastmod]) if url[:lastmod] != nil 
            @xml.changefreq(url[:changefreq]) if url[:changefreq] != nil
            @xml.priority(url[:priority])  if url[:priority] != nil
          }
          
        end
      }
      
      @xml
      
    end
       
  end
  
end