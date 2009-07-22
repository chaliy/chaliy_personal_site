class Draft
  attr_accessor :title
  attr_accessor :content
  attr_accessor :pubDate
  
  def initialize(title, name, content)
    @title = title
    @name = name
    @content = content
  end
  
  def self.page
    
    [Draft.new("Test", "Test", "Test"), Draft.new("Test", "Test", "Test")]
    
  end
  
end