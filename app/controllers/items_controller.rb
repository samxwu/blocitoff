class ItemsController < ApplicationController
  
#  def new
#    @item = Item.new
#  end

  def create
  #  @item = Item.new
  #  @item.name = params[:item][:name]
  #  @item.user = current_user

  #respond_to do |format|
  #  if @item.save
  #    format.html { redirect_to user_path(current_user.id), notice: 'Item was successfully saved.'}
  #    format.js
  #  else
  #    format.html { redirect_to user_path(current_user.id), notice: 'Error creating item. Please try again.'}
  #  end
  #end
  
  
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
  
  
  
  def destroy
      
      @user = current_user
      @item = @user.items.find(params[:id])
      
    respond_to do |format|
      if @item.destroy
        format.html { redirect_to @user, notice: 'Item was deleted.'}
        format.js
      else
        format.html { redirect_to @user, notice: 'Error deleting item. Please try again.'}
        format.js
      end
    end

  
  
  
end
