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
  
  describe '#update' do
    before(:each) do
      @category = Factory(:category)
    end
    
    describe "with valid params" do
      before(:each) do
        Category.any_instance.stub(:update_attributes).and_return(true)
      end
      
      it "updates the category" do
        Category.any_instance.should_receive(:update_attributes)
        put 'update', :id => @category.id
      end
      
      it "redirects to the categories page" do
        put 'update', :id => @category.id
        response.should redirect_to(categories_path)
      end
    end
    
    describe "with invalid parameters" do
      before(:each) do
        Category.any_instance.stub(:update_attributes).and_return(false)
        put 'update', :id => @category.id
      end
      
      it "sets an instance variable containing the category" do
        assigns[:category].should be_an_instance_of(Category)
      end
      
      it "renders the 'edit' template" do
        response.should render_template(:edit)
      end
      
    end
  end
  
  describe "#destroy" do
    before(:each) do
      @category = Factory(:category)
      delete 'destroy', :id => @category.id
    end
    
    it "destroys the category" do
      lambda{ Category.find(@category.id) }.should raise_error(ActiveRecord::RecordNotFound)
    end
    
    it "redirects to the categories page" do
      response.should redirect_to(categories_path)
    end
    
  end
end
