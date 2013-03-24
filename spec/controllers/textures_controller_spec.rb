require 'spec_helper'

describe TexturesController do

  context "as guest" do
    let(:texture) { FactoryGirl.create(:texture) }
    it "index action should render index template" do
      get :index
      response.should render_template(:index)
    end

    it "show action should render show template" do
      get :show, :id => texture
      response.should render_template(:show)
    end

    it_should_require_admin_for_actions :edit, :update
  end

  context "as admin" do

    let(:texture) { FactoryGirl.create(:texture) }

    before(:each) do
      login_as_admin
    end

    it "edit action should render edit template" do
      get :edit, :id => texture
      response.should render_template(:edit)
    end

    it "update action should render edit template when model is invalid" do
      put :update, :id => texture, :texture => { :body => "" }
      response.code.should == "200"
      response.should render_template(:edit)
    end

    it "update action should redirect when model is valid" do
      Texture.any_instance.stubs(:valid?).returns(true)
      put :update, :id => texture
      # Should redirect to URL matching label...
      response.should redirect_to(root_path + assigns[:texture].label)
    end
  end


#  # This should return the minimal set of attributes required to create a valid
#  # Texture. As you add validations to Texture, be sure to
#  # update the return value of this method accordingly.
#  def valid_attributes
#    {}
#  end
#
#  describe "GET index" do
#    it "assigns all textures as @textures" do
#      texture = Texture.create! valid_attributes
#      get :index
#      assigns(:textures).should eq([texture])
#    end
#  end
#
#  describe "GET show" do
#    it "assigns the requested texture as @texture" do
#      texture = Texture.create! valid_attributes
#      get :show, :id => texture.id.to_s
#      assigns(:texture).should eq(texture)
#    end
#  end
#
#  describe "GET new" do
#    it "assigns a new texture as @texture" do
#      get :new
#      assigns(:texture).should be_a_new(Texture)
#    end
#  end
#
#  describe "GET edit" do
#    it "assigns the requested texture as @texture" do
#      texture = Texture.create! valid_attributes
#      get :edit, :id => texture.id.to_s
#      assigns(:texture).should eq(texture)
#    end
#  end
#
#  describe "POST create" do
#    describe "with valid params" do
#      it "creates a new Texture" do
#        expect {
#          post :create, :texture => valid_attributes
#        }.to change(Texture, :count).by(1)
#      end
#
#      it "assigns a newly created texture as @texture" do
#        post :create, :texture => valid_attributes
#        assigns(:texture).should be_a(Texture)
#        assigns(:texture).should be_persisted
#      end
#
#      it "redirects to the created texture" do
#        post :create, :texture => valid_attributes
#        response.should redirect_to(Texture.last)
#      end
#    end
#
#    describe "with invalid params" do
#      it "assigns a newly created but unsaved texture as @texture" do
#        # Trigger the behavior that occurs when invalid params are submitted
#        Texture.any_instance.stub(:save).and_return(false)
#        post :create, :texture => {}
#        assigns(:texture).should be_a_new(Texture)
#      end
#
#      it "re-renders the 'new' template" do
#        # Trigger the behavior that occurs when invalid params are submitted
#        Texture.any_instance.stub(:save).and_return(false)
#        post :create, :texture => {}
#        response.should render_template("new")
#      end
#    end
#  end
#
#  describe "PUT update" do
#    describe "with valid params" do
#      it "updates the requested texture" do
#        texture = Texture.create! valid_attributes
#        # Assuming there are no other textures in the database, this
#        # specifies that the Texture created on the previous line
#        # receives the :update_attributes message with whatever params are
#        # submitted in the request.
#        Texture.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
#        put :update, :id => texture.id, :texture => {'these' => 'params'}
#      end
#
#      it "assigns the requested texture as @texture" do
#        texture = Texture.create! valid_attributes
#        put :update, :id => texture.id, :texture => valid_attributes
#        assigns(:texture).should eq(texture)
#      end
#
#      it "redirects to the texture" do
#        texture = Texture.create! valid_attributes
#        put :update, :id => texture.id, :texture => valid_attributes
#        response.should redirect_to(texture)
#      end
#    end
#
#    describe "with invalid params" do
#      it "assigns the texture as @texture" do
#        texture = Texture.create! valid_attributes
#        # Trigger the behavior that occurs when invalid params are submitted
#        Texture.any_instance.stub(:save).and_return(false)
#        put :update, :id => texture.id.to_s, :texture => {}
#        assigns(:texture).should eq(texture)
#      end
#
#      it "re-renders the 'edit' template" do
#        texture = Texture.create! valid_attributes
#        # Trigger the behavior that occurs when invalid params are submitted
#        Texture.any_instance.stub(:save).and_return(false)
#        put :update, :id => texture.id.to_s, :texture => {}
#        response.should render_template("edit")
#      end
#    end
#  end
#
#  describe "DELETE destroy" do
#    it "destroys the requested texture" do
#      texture = Texture.create! valid_attributes
#      expect {
#        delete :destroy, :id => texture.id.to_s
#      }.to change(Texture, :count).by(-1)
#    end
#
#    it "redirects to the textures list" do
#      texture = Texture.create! valid_attributes
#      delete :destroy, :id => texture.id.to_s
#      response.should redirect_to(textures_url)
#    end
#  end

end
