class EntryIndex
  
  def initialize(path)
    @path = path
  end
  
  def entries
    
    entry_pathes = Dir.glob(@path + "/*.text")
    entry_pathes.map {|path| 
      entry = EntryFile.new
      entry.read_file path
    }    
    
  end
end