class EntryIndex
  
  def initialize(path)
    @path = path
  end
  
  def entries(t)
    
    ensureIndex
    
    case t
      when :published then published_entries
      when :drafts  then draft_entries
      when :all then all_entries
      else all_entries
    end
    
  end
  
  private
  
  def ensureIndex
    if !@loaded
      
      entry_pathes = Dir.glob(@path + "/**/*.text")
      @entries = entry_pathes.map {|path| 
        entry = EntryFile.new
        entry.read_file path
        entry
      }
      
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