require 'maruku'

module EntryStore
  
  class Entry
    
    def perma_link
      drafts_entry_path(self.name, self.published_on.year, self.published_on.month)
    end
    
    def content
      maruku(self.content_markup) 
    end
    
    def description
      maruku(self.description_markup) 
    end
    
    def keywords_as_text      
      (keywords + categories).join(", ")      
    end
        
    private
    def maruku(s)
      Maruku.new(s).to_html
    end
    
  end
    
end