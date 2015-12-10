class UnitsController < ApplicationController
  def index
    @units = current_user.units.all
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new
    @unit.name = params[:name]
    @unit.user_id = current_user.id

    if @unit.save

      redirect_to "/units", :notice => "Unit created successfully."
    else
      render 'new'
    end
  end

  def newunit
    @unit = Unit.new
  end

  def createunit
    @unit = Unit.new
    @unit.name = params[:name]
    @unit.user_id = current_user.id

    if @unit.save
      redirect_to "/items/new", :notice => "Unit created successfully."
    else
      render 'newunit'
    end
  end

  def adddefault
    temp = ["nos", "bag", "box", "doz", "lb", "gal", "quart", "pint", "oz", "fl oz"]
    temp.each do |temp|
      @unit = Unit.new
      @unit.name = temp
      @unit.user_id = current_user.id
      @unit.save
    end
    redirect_to "/units"
  end

  def edit
    @unit = Unit.find(params[:id])
    if (@unit.user_id == current_user.id)
      render 'edit'
    else
      redirect_to "/units", :alert => "Access Denied"
    end
  end

  def update
    @unit = Unit.find(params[:id])

    if (@unit.user_id == current_user.id)

      @unit.name = params[:name]

      @unit.user_id = current_user.id

      @unit.save
      redirect_to "/units", :notice => "Unit updated successfully."
    else
      render 'edit'
    end

  end

  def destroy
    @unit = Unit.find(params[:id])

    if (@unit.user_id == current_user.id)

      @unit.destroy

      redirect_to "/units", :notice => "Unit deleted."

    else
      redirect_to "/units", :alert => "Access Denied"
    end
  end
end
