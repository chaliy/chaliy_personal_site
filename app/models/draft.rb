require 'maruku'

class Draft
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
    
  def self.page
    
    index = EntryIndex.new "./content/drafts"
    index.entries.map { |entry|
        Draft.new(entry.title, entry.title, entry.content)
    }
    
  end
  
end