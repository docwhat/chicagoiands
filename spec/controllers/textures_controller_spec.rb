# coding: utf-8

require 'spec_helper'

describe TexturesController do
  context 'as guest' do
    let(:texture) { FactoryGirl.create(:texture) }
    it 'index action should render index template' do
      get :index
      response.should render_template(:index)
    end

    it 'show action should render show template' do
      get :show, id: texture
      response.should render_template(:show)
    end

    it_should_require_admin_for_actions :edit, :update
  end

  context 'as admin' do
    let(:texture) { FactoryGirl.create(:texture) }

    before(:each) do
      login_as_admin
    end

    it 'edit action should render edit template' do
      get :edit, id: texture

      expect(response).to render_template(:edit)
    end

    it 'update action should render edit template when model is invalid' do
      put :update, id: texture, texture: { body: '' }

      expect(response).to be_ok
      expect(response).to render_template(:edit)
    end

    it 'update action should redirect when model is valid' do
      Texture.any_instance.stub(:valid?).and_return(true)
      put :update, id: texture

      # Should redirect to URL matching label...
      expect(response).to redirect_to(root_path + assigns[:texture].label)
    end
  end
end
