require 'spec/spec_helper'

describe Entry do
  it "should return drafts page" do
    Entry.drafts_page.should_not be_empty
  end
  
  it "should return public page" do
    Entry.public_page.should_not be_empty
  end
  
end