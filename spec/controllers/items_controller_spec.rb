require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  
  context "guest user" do
  let(:guest_user) { User.create!(email: "user@bloccit.com", password: "password") }
  let(:guest_item) { guest_user.items.create(name: "Read a book.") }

    describe "Item create" do
      it "returns http redirect" do
        post :create, { user_id: guest_user.id, name: guest_item.name }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, user_id: guest_user.id, id: guest_item.id
        expect(response).to have_http_status(:redirect)
      end
    end
  end
  
  context "signed-in user" do
    before do
      @my_user = FactoryGirl.create :user
      @my_user.confirm
      sign_in @my_user
      @my_item = @my_user.items.create(name: "Read a book.")
      
    #  my_user.confirm
    #  sign_in my_user
    end
    
    describe "Item create" do
      it "increases the number of Item by 1" do
        expect{ post :create, user_id: @my_user.id, id: @my_item.id, item: {name: @my_item.name} }.to change(Item, :count).by(1)
      end
      
      it "assigns the new item to @item" do
        post :create, user_id: @my_user.id, id: @my_item.id, item: { name: @my_item.name }
        expect(assigns(:item)).to eq Item.last
      end
      
      it "redirects to user path" do
        post :create, user_id: @my_user.id, id: @my_item.id, item: { name: @my_item.name }
        expect(response).to redirect_to user_path(@my_user)
      end
    end
    
    describe "DELETE destroy" do
      it "deletes the post" do
        delete :destroy, {user_id: @my_user.id, id: @my_item.id, format: :js}
        count = Item.where({id: @my_item.id}).size
        expect(count).to eq 0
      end
    end
    
  end

end