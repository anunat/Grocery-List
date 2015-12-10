class ShoppinglistsController < ApplicationController
  def index
    @shoppinglists = current_user.shoppinglists.all
  end

  def show
    @shoppinglist = Shoppinglist.find(params[:id])

    if (@shoppinglist.user_id == current_user.id)
      render 'show'
    else
     redirect_to "/shoppinglists", :alert => "Access Denied"
   end

 end

 def new
  @shoppinglist = Shoppinglist.new
end

def create
  @shoppinglist = Shoppinglist.new
  @shoppinglist.user_id = current_user.id

  if @shoppinglist.save
    redirect_to "/users/editlist", :notice => "Shoppinglist created successfully."
  else
    render 'new'
  end
end

def newdefault
  @shoppinglist = Shoppinglist.new
end

def createdefault
  @shoppinglist = Shoppinglist.new
  @shoppinglist.user_id = current_user.id
  @shoppinglist.name = params[:name]

  @shoppinglist.save

  Item.where(:user_id => current_user.id, :favorite => true).each do |item|
    listitem = Listitem.new
    listitem.shoppinglist_id = @shoppinglist.id
    listitem.item_id = item.id
    listitem.quantity = item.default_qty
    listitem.save
  end

  redirect_to "/users/editlist", :notice => "Shoppinglist created successfully."

end

def destroy
  @shoppinglist = Shoppinglist.find(params[:id])

  if (@shoppinglist.user_id == current_user.id)

    @shoppinglist.destroy

    redirect_to "/shoppinglists", :notice => "Shoppinglist deleted."
  else
    redirect_to "/shoppinglists", :alert => "Access Denied"
  end
end
end
