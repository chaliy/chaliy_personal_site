require 'spec/spec_helper'

describe EntryIndex do
  it "should parse content" do
    index = EntryIndex.new File.dirname(__FILE__)
    index.entries.should_not be_empty
  end
end
