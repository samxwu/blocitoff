class ItemsController < ApplicationController

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


  def destroy
    @user = current_user
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item has been completed!"
    else
      flash[:alert] = "There was an error completing the item. Try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

end
