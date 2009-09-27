module EntryStore

  class Index
    include Singleton
    
    def initialize()
      @path = "#{RAILS_ROOT}/content"
    end
    
    def page(t)
      
      ensureIndex
      
      case t
        when :published then published_entries
        when :drafts  then draft_entries
        when :all then all_entries
        else all_entries
      end
      
    end
    
    def find(year, month, name)
      ensureIndex
      
      found_entries = @entries.select do |entry|
        publiched_on = entry.published_on; 
        (publiched_on.year == year.to_i && publiched_on.month == month.to_i && entry.name == name)
      end
      
      found_entries.first
      
    end  
    
    def findByName(name)
      ensureIndex
      
      found_entries = @entries.select do |entry|
        publiched_on = entry.published_on; 
        (entry.name == name)
      end
      
      found_entries.first
      
    end
    
    # statics
    def self.page(t)    
      self.instance.page(t)
    end
    
    def self.find(year, month, name)    
      self.instance.find(year, month, name)
    end
    
    def self.findByName(name)    
      self.instance.findByName(name)
    end
              
    private
    
    def ensureIndex
      if !@loaded
        
        entry_pathes = Dir.glob(@path + "/**/*.text")
        @entries = entry_pathes.map {|path| 
          entry = Entry.new
          entry.read_file path
          entry
        }.sort {|a, b| 
          a.published_on <=> b.published_on
        }.reverse
        
      end
    end
    
    def published_entries
      @entries.select do |entry|
        entry.published?
      end
    end
    
    def draft_entries
      @entries.select do |entry|
        !entry.published?
      end
    end
    
    def all_entries
      @entries
    end
     
  end
  
end