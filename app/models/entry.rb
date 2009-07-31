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
    
  def self.drafts_page
    
    self.page :drafts
    
  end
  
  def self.public_page
    
    self.page :published
    
  end
  
  def self.find(year, month, name)
     index = EntryIndex.new "#{RAILS_ROOT}/content"
     index.find(year, month, name)
  end
  
  private
    def self.page(t)
      index = EntryIndex.new "#{RAILS_ROOT}/content"
      index.entries(t).map { |entry|
          Entry.new(entry.title, entry.name, entry.published_on, entry.content)
      }
    end
    
end
