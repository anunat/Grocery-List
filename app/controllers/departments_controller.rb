class DepartmentsController < ApplicationController
  def index
    @departments = current_user.departments.all
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new
    @department.name = params[:name]
    @department.user_id = current_user.id

    if @department.save
      redirect_to "/departments", :notice => "Department created successfully."
    else
      render 'new'
    end
  end

  def newdept
    @department = Department.new
  end

  def createdept
    @department = Department.new
    @department.name = params[:name]
    @department.user_id = current_user.id

    if @department.save
      redirect_to "/items/new", :notice => "Department created successfully."
    else
      render 'newdept'
    end
  end

  def adddefault
    temp = ["Fruits", "Dairy", "Vegetables", "Bakery", "Snacks", "Baking", "Deli", "Meat", "Beverages", "Other"]
    temp.each do |temp|
      @department = Department.new
      @department.name = temp
      @department.user_id = current_user.id
      @department.save
    end
    redirect_to "/departments"
  end

  def edit
    @department = Department.find(params[:id])
    if (@department.user_id == current_user.id)
      render 'edit'
    else
      redirect_to "/departments", :alert => "Access Denied"
    end
  end

  def update
    @department = Department.find(params[:id])

    if (@department.user_id == current_user.id)

      @department.name = params[:name]

      @department.user_id = current_user.id

      @department.save
      redirect_to "/departments", :notice => "Department updated successfully."
    else
      redirect_to "/departments"
    end
  end

  def destroy
    @department = Department.find(params[:id])

    if (@department.user_id == current_user.id)

      @department.destroy

      redirect_to "/departments", :notice => "Department deleted."

    else
      redirect_to "/departments", :alert => "Access Denied"
    end
  end
end
