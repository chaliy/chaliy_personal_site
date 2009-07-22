require 'spec/spec_helper'

describe EntryFile do
  it "should read content" do
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

  it "should read title" do
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

end