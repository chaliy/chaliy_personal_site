require 'maruku'

class Entry
  attr_reader :title
  attr_reader :name
  attr_reader :content_markup
  attr_reader :content
  attr_reader :published_on
  
  def initialize(title, name, published_on, content)
    @title = title
    @name = name
    @published_on = published_on
    @content_markup = content
    doc = Maruku.new(content)
    @content = doc.to_html       
  end
  
  def self.from_entry(entry)
    Entry.new(entry.title, entry.name, entry.published_on, entry.content)
  end
  
  def perma_link
    drafts_entry_path(@name, @published_on.year, @published_on.month)
  end
    
  def self.page(t)    
    EntryIndex.instance.entries(t).map { |entry|
        Entry.from_entry(entry)
    }
  end  
  
  def self.find(year, month, name)
     Entry.from_entry(EntryIndex.instance.find(year, month, name))
  end
     
end
