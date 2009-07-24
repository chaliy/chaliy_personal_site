class Entry
  attr_reader :title
  attr_reader :name
  attr_reader :content_markup
  attr_reader :content
  attr_reader :pubDate
  
  def initialize(title, name, content)
    @title = title
    @name = name
    @content_markup = content
    doc = Maruku.new(content)
    @content = doc.to_html
  end
    
  def self.drafts_page
    
    self.page "./content/drafts"
    
  end
  
  def self.public_page
    
    self.page "./content/public"
    
  end
  
  private
    def self.page(path)
      index = EntryIndex.new path
      index.entries.map { |entry|
          Entry.new(entry.title, entry.title, entry.content)
      }
    end
    
end
