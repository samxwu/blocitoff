class ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new
    @item.name = params[:item][:name]
    @item.user = current_user
    
    if @item.save
        flash[:notice] = "Item was saved successfully."
        redirect_to user_path(current_user.id)
        
    else
        flash.now[:alert] = "Error creating item. Please try again."
        redirect_to user_path(current_user.id)
    end

  end
  
  
  
end
