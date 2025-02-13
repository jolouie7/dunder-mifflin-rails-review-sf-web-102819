class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
    redirect_to @employee
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
    redirect_to @employee
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy!
    redirect_to employees_path
  end

  # No one at Dunder Mifflin can have the same alias and/or job title (Dwight made up that rule!)
  # use find_or_create_by?

  private 
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end
end
