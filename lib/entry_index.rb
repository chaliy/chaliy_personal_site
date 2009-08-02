class EntryIndex
  include Singleton
  
  def initialize()
    @path = "#{RAILS_ROOT}/content"
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
  
  def find(year, month, name)
    ensureIndex
    
    found_entries = @entries.select do |entry|
      publiched_on = entry.published_on; 
      (publiched_on.year == year.to_i && publiched_on.month == month.to_i && entry.name == name)
    end
    
    found_entries.first
    
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