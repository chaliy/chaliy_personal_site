class EntryFile
  
  attr_reader :title
  attr_reader :content
  
  def read_file(input_path)
    input_text = File.read(input_path)
    read_text(input_text)
  end
    
  def read_text(input_text)
    
    @content = ""
    @title = ""
        
    if input_text =~ /^(---\s*\n.*?\n?)(---.*?)/m
      content_text = input_text[($1.size + $2.size)..-1]
    
      header = YAML.load($1)
      
      @content = content_text.strip()
      @title = header["title"]
    end
   
  end

end