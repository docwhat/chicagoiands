require 'spec_helper'

describe StoriesController do
#  fixtures :all
#  render_views

  context "as guest" do
    let(:story) { Factory.create(:story) }
    it "index action should render index template" do
      get :index
      response.should render_template(:index)
    end

    it "show action should render show template" do
      get :show, :id => story
      response.should render_template(:show)
    end

    it_should_require_admin_for_actions :new, :create, :edit, :update, :destroy
  end

  context "as admin" do

    let(:story) { Factory.create(:story) }

    before(:each) do
      login_as_admin
    end

    it "new action should render new template" do
      get :new
      response.should render_template(:new)
    end

    it "create action should render new template when model is invalid" do
      post :create
      response.code.should == "200"
      response.should render_template(:new)
    end

    it "create action should redirect when model is valid" do
      post :create, :story => Factory.attributes_for(:story)
      assigns[:story].should_not be_new_record
      response.should redirect_to(story_url(assigns[:story]))
    end

    it "edit action should render edit template" do
      get :edit, :id => story
      response.should render_template(:edit)
    end

    it "update action should render edit template when model is invalid" do
      put :update, :id => story, :story => { :title => "" }
      response.code.should == "200"
      response.should render_template(:edit)
    end

    it "update action should redirect when model is valid" do
      Story.any_instance.stubs(:valid?).returns(true)
      put :update, :id => story
      response.should redirect_to(story_url(assigns[:story]))
    end

    it "destroy action should destroy model and redirect to index action" do
      delete :destroy, :id => story
      response.should redirect_to(stories_url)
      Story.exists?(story.id).should be_false
    end
  end
end
