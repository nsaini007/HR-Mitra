class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def show
  end

  def edit
    @employee = Employee.find(params[:id])
  end
  
  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to employees_path, notice: "Employee has been updated successfully"
    else
      render :edit
    end
    
  end

  def create
    # not recommended use permit for less writing of code

    # @employee = Employee.new(first_name: params[:employee][:first_name],middle_name:params[:employee][:middle_name], last_name: params[:employee][:last_name], personal_email: params[:employee][:personal_email], city: params[:employee][:city], state: params[:employee][:state], country: params[:employee][:country], pincode: params[:employee][:pincode], address_line_1: params[:employee][:address_line_1], address_line_2: params[:employee][:address_line_2])

    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path, notice: "Employee has been created successfully"
    else
      render :new
    end
  end

  private
  #permitting strong perameters
    def employee_params
        params.require(:employee).permit(:first_name, :middle_name, :last_name, :personal_email, :city, :state, :country, :pincode, :address_line_1, :address_line_2)
    end
end
