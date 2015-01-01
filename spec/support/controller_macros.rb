module ControllerMacros
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def it_should_require_admin_for_actions(*actions)
      actions.each do |action|
        it "should require admin with #{action} action " do
          get action, id: 1
          expect(response).to redirect_to(login_url)
          expect(flash[:notice]).to eq('Please login first')
        end
      end
    end
  end

  def login_as_admin
    # We don't have a concept of 'admin', just a user...they are automatically an admin.
    user = FactoryGirl.create(:user, password: 'foobar')
    session[:user_id] = user.id
  end
end
