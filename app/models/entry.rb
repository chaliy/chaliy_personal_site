require 'maruku'

class Entry
  attr_reader :title
  attr_reader :name
  attr_reader :content_markup
  attr_reader :content
  attr_reader :published_on
  attr_reader :description
  attr_reader :categories
  attr_reader :keywords
  
  def initialize(title, name, published_on, content, description, categories)
    @title = title
    @name = name
    @published_on = published_on
    @content_markup = content
    doc = Maruku.new(content)
    @content = doc.to_html       
    @description = description || make_description(content)
    @categories = categories
    @keywords = categories.join(", ") 
  end  
  
  def self.from_entry(entry)
    Entry.new(entry.title, entry.name, entry.published_on, entry.content, entry.description, entry.categories)
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
    e = EntryIndex.instance.find(year, month, name)
    Entry.from_entry(e) if e != nil
  end
  
  def self.findByName(name)
    e = EntryIndex.instance.findByName(name)
    Entry.from_entry(e) if e != nil
  end
 
 
 
  private
  def make_description(s)
    s = Maruku.new(s[0...450] + "...");
  end
     
end
