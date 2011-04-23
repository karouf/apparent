require 'spec_helper'

describe CategoriesController do

  describe '#create' do
    describe "with valid params" do
      before(:each) do
        Category.any_instance.stub(:valid?).and_return(true)
      end
      
      it "saves the new category" do
        Category.any_instance.should_receive(:save)
        post 'create'
      end
      
      it "redirects to the categories page" do
        post 'create'
        response.should redirect_to(categories_path)
      end
    end
    
    describe "with invalid parameters" do
      before(:each) do
        Category.any_instance.stub(:valid?).and_return(false)
        post 'create'
      end
      
      it "sets an instance variable containing the new category" do
        assigns[:category].should be_an_instance_of(Category)
      end
      
      it "renders the 'new' template" do
        response.should render_template(:new)
      end
      
    end
  end
end
