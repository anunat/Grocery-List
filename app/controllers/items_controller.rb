class ItemsController < ApplicationController
  def index
    @items = current_user.items.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.unit_id = params[:unit_id]
    @item.default_qty = params[:default_qty]
    if(params[:favorite] != nil)
      @item.favorite = true
    else
      @item.favorite = false
    end
    @item.user_id = params[:user_id]
    @item.image = params[:image]
    @item.department_id = params[:department_id]
    @item.name = params[:name]

    if @item.save
      redirect_to "/items", :notice => "Item created successfully."
    else
      render 'new'
    end
  end

  def adddefault
    deptnames = ["Fruits", "Dairy", "Vegetables", "Bakery", "Snacks", "Baking", "Breakfast", "Meat", "Beverages", "Other"]
    deptnames.each do |deptname|
      @department = Department.new
      @department.name = deptname
      @department.user_id = current_user.id
      @department.save
    end

    unitnames = ["nos", "bag", "box", "doz", "lb", "gal", "quart", "pint", "oz", "fl oz"]
    unitnames.each do |unitname|
      @unit = Unit.new
      @unit.name = unitname
      @unit.user_id = current_user.id
      @unit.save
    end

    itemnames = ["Milk", "Eggs", "Bread", "Apples", "Bananas", "Carrots", "Potatoes", "Flour", "Sugar", "Wine"]

    unitnames = ["gal", "doz", "nos", "nos", "nos", "lb", "lb", "lb", "lb", "nos"]

    deptnames = ["Dairy", "Dairy", "Breakfast", "Fruits", "Fruits", "Vegetables", "Vegetables", "Baking", "Baking", "Beverages"]

    count = 0
    while (count<10)

      if(!current_user.units.find_by(:name => unitnames[count]))
        @unit = Unit.new
        @unit.name = unitnames[count]
        @unit.user_id = current_user.id
        @unit.save
      else
        @unit = current_user.units.find_by(:name => unitnames[count])
      end

      if(!current_user.departments.find_by(:name => deptnames[count]))
        @department = Department.new
        @department.name = deptnames[count]
        @department.user_id = current_user.id
        @department.save
      else
        @department = current_user.departments.find_by(:name => deptnames[count])
      end

      if(!current_user.items.find_by(:name => itemnames[count]))
        @item = Item.new
        @item.unit_id = @unit.id
        @item.default_qty = 1
        @item.favorite = false

        @item.user_id = current_user.id

        @item.department_id = @department.id
        @item.name = itemnames[count]

        @item.save

        filename = './public/assets/images/'+itemnames[count]+'.jpg'

        File.open(filename) do |f|
          @item.image = f
        end
        @item.save!
      end

      count = count + 1
    end
    redirect_to "/items", :notice => "Items created successfully."
  end

  def edit
    @item = Item.find(params[:id])

    if (@item.user_id == current_user.id)
      render 'edit'
    else
      redirect_to "/items", :alert => "Access Denied"
    end
  end

  def update
    @item = Item.find(params[:id])

    if (@item.user_id == current_user.id)

      @item.unit_id = params[:unit_id]
      @item.default_qty = params[:default_qty]

      if(params[:favorite] != nil)
        @item.favorite = true
      else
        @item.favorite = false
      end

      @item.user_id = params[:user_id]
      @item.image = params[:image]
      @item.department_id = params[:department_id]
      @item.name = params[:name]

      @item.save

      redirect_to "/items", :notice => "Item updated successfully."
    else
      render 'edit'
    end

  end

  def updatefav
    @item = Item.find(params[:id])

    if (@item.user_id == current_user.id)

      @item.favorite = params[:favorite]

      @item.save

      redirect_to :back, :notice => "Fav Item updated successfully."
    else
      redirect_to :back, :alert => "Access Denied"
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if (@item.user_id == current_user.id)

      @item.destroy

      redirect_to "/items", :notice => "Item deleted."

    else
      redirect_to "/items", :alert => "Access Denied"
    end
  end
end
