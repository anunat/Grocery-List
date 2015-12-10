class ListitemsController < ApplicationController

  def create
    @listitem = Listitem.new
    @listitem.notes = params[:notes]
    @listitem.shoppinglist_id = params[:shoppinglist_id]
    @listitem.item_id = params[:item_id]
    @listitem.quantity = params[:quantity]

    if @listitem.save
      redirect_to :back, :notice => "Listitem created successfully."
    else
      redirect_to :back, :alert => "Listitem creation unsuccessful."
    end
  end

  def edit
    @listitem = Listitem.find(params[:id])
  end

  def update
    @listitem = Listitem.find(params[:id])

    @listitem.notes = params[:notes]
    @listitem.shoppinglist_id = params[:shoppinglist_id]
    @listitem.item_id = params[:item_id]
    @listitem.quantity = params[:quantity]

    if @listitem.save
      redirect_to :back, :notice => "Listitem updated successfully."
    else
      redirect_to :back, :alert => "Listitem update unsuccessful."
    end
  end

  def destroy
    @listitem = Listitem.find(params[:id])

    @listitem.destroy

    redirect_to :back, :notice => "Listitem deleted."
  end
end
