require 'spec_helper'

describe MeetingsController do
  # fixtures :all
  # render_views

  describe 'as guest' do
    let(:meeting) { FactoryGirl.create(:meeting) }
    it 'index action should render index template' do
      get :index

      expect(response).to render_template(:index)
    end

    it 'show action should render show template' do
      get :show, id: meeting

      expect(response).to render_template(:show)
    end

    it 'dvd action should render dvd template' do
      get :dvds, url: '/dvds'

      expect(response).to render_template(:dvds)
    end

    it_should_require_admin_for_actions :new, :create, :edit, :update, :destroy
  end

  context 'as admin' do
    let(:meeting) { FactoryGirl.create(:meeting) }

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
      post :create, meeting: FactoryGirl.attributes_for(:meeting)
      expect(assigns[:meeting]).not_to be_new_record

      expect(response).to redirect_to(meeting_url(assigns[:meeting]))
    end

    it 'edit action should render edit template' do
      get :edit, id: meeting

      expect(response).to render_template(:edit)
    end

    it 'update action should render edit template when model is invalid' do
      put :update, id: meeting, meeting: { title: '' }

      expect(response).to be_ok
      expect(response).to render_template(:edit)
    end

    it 'update action should redirect when model is valid' do
      allow_any_instance_of(Meeting).to receive(:valid?).and_return(true)
      put :update, id: meeting

      expect(response).to redirect_to(meeting_url(assigns[:meeting]))
    end

    it 'destroy action should destroy model and redirect to index action' do
      delete :destroy, id: meeting

      expect(response).to redirect_to(meetings_url)
      expect(Meeting).to_not exist(meeting.id)
    end
  end
end
