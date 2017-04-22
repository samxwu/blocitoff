require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe "guest user" do
    let(:guest_user) { User.create!(email: "user@bloccit.com", password: "password") }

    it "redirects to new user session" do
      get :show, {id: guest_user.id}
      expect(response).to redirect_to new_user_session_path
    end
  end
    
  describe "signed in user" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      @user.confirm 
      sign_in @user
    end

    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end
  
    it "sets user name properly" do
      expect(subject.current_user.username).to eq @user.username
    end
    
    it "sets user email properly" do
      expect(subject.current_user.email).to eq @user.email
    end
    
    it "returns http success" do
      get :show, {id: subject.current_user.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, {id: subject.current_user.id}
      expect(response).to render_template :show
    end
    
  end

end
