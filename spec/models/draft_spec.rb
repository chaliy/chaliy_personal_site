require 'app/models/draft.rb'

describe Draft do
  it "should return page" do
    Draft.page.should_not be_empty
  end
end