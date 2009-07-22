require 'spec/spec_helper'

describe DraftsController, " index" do
  
  it "should fill entries" do
    
    get :index
    
    assigns[:entries].should_not be_empty
    
  end
   
end