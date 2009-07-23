require 'spec/spec_helper'

describe EntryFile do
  it "should parse content" do
    entry = EntryFile.new
    text = <<A2
---
title: fake
---
Etalone content
A2

    entry.read_text(text)
    entry.content.should == "Etalone content"
    
  end

  it "should parse title" do
    entry = EntryFile.new
    text = <<A2
---
title: Etalone title
---
Fake Content
A2
    entry.read_text(text)
    entry.title.should == "Etalone title" 

  end

  it "should read from file" do
    entry = EntryFile.new
    
    entry.read_file(File.dirname(__FILE__) + "/example.text")
    
    entry.title.should_not be_empty
    
  end

end