module EntryStore
  class Entry
    
    attr_reader :title
    attr_reader :name
    attr_reader :published_on
    attr_reader :content_markup
    attr_reader :description_markup
    attr_reader :categories
    attr_reader :keywords
    attr_reader :image_url
    attr_reader :last_updated_on
    
    def published?() 
      @published 
    end 
  
    def read_file(input_path)
      input_name = File.basename(input_path, ".text")
      input_text = File.read(input_path)
      read_text(input_name, input_text)
    end
      
    def read_text(input_name, input_text)
      
      @content_markup = ""    
      @title = ""
      @name = input_name
      @published_on = nil
          
      if input_text =~ /^(---\s*\n.*?\n?)(---.*?)/m
        content_text = input_text[($1.size + $2.size)..-1]
      
        header = YAML.load($1)
        
        @content_markup = content_text.strip()
        @title = header["title"]      
        @published_on = DateTime.parse(header["published_on"])      
        @published = header["published"]
        @description_markup = header["description"]
        @categories = header["categories"] || []
        @keywords = header["keywords"] || []
        @image_url = header["image"]
        @last_updated_on = header["last_updated_on"] || @published_on
      end
     
    end
  
  end
end