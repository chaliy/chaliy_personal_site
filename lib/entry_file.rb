class EntryFile
  
  attr_reader :title
  attr_reader :name
  attr_reader :published_on
  attr_reader :content
  
  def published?() 
    @published 
  end 

  
  def read_file(input_path)
    input_name = File.basename(input_path, ".text")
    input_text = File.read(input_path)
    read_text(input_name, input_text)
  end
    
  def read_text(input_name, input_text)
    
    @content = ""    
    @title = ""
    @name = input_name
    @published_on = nil
        
    if input_text =~ /^(---\s*\n.*?\n?)(---.*?)/m
      content_text = input_text[($1.size + $2.size)..-1]
    
      header = YAML.load($1)
      
      @content = content_text.strip()
      @title = header["title"]      
      @published_on = header["published_on"] == nil ? Date.today : DateTime.parse(header["published_on"]) 
      @published = header["published"]
    end
   
  end

end