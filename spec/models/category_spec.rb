require 'spec_helper'

describe Category do
  
  it "should have a name" do
    category = Factory.build(:category)
    category.name = 'Helmet'
    category.save.should be_true
    category.name = nil
    category.save.should be_false
    category.name = ''
    category.save.should be_false
  end
  
end
