require 'spec_helper'

describe StoriesController do
  #  fixtures :all
  #  render_views

  context 'as guest' do
    let(:story) { FactoryGirl.create(:story) }
    it 'index action should render index template' do
      get :index

      expect(response).to render_template(:index)
    end

    it 'show action should render show template' do
      get :show, id: story
      expect(response).to render_template(:show)
    end

    it_should_require_admin_for_actions :new, :create, :edit, :update, :destroy
  end

  context 'as admin' do
    let(:story) { FactoryGirl.create(:story) }

    before(:each) do
      login_as_admin
    end

    it 'new action should render new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'create action should render new template when model is invalid' do
      post :create

      expect(response).to be_ok
      expect(response).to render_template(:new)
    end

    it 'create action should redirect when model is valid' do
      post :create, story: FactoryGirl.attributes_for(:story)
      assigns[:story].should_not be_new_record

      expect(response).to redirect_to(story_url(assigns[:story]))
    end

    it 'edit action should render edit template' do
      get :edit, id: story

      expect(response).to render_template(:edit)
    end

    it 'update action should render edit template when model is invalid' do
      put :update, id: story, story: { title: '' }

      expect(response).to be_ok
      expect(response).to render_template(:edit)
    end

    it 'update action should redirect when model is valid' do
      Story.any_instance.stub(:valid?).and_return(true)
      put :update, id: story

      expect(response).to redirect_to(story_url(assigns[:story]))
    end

    it 'destroy action should destroy model and redirect to index action' do
      delete :destroy, id: story

      expect(response).to redirect_to(stories_url)
      expect(Story).to_not exist(story.id)
    end
  end
end
