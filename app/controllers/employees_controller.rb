class EmployeesController < ApplicationController
  
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
    # employee_hash = Unirest.get("http://localhost:3000/employees/#{params[:id]}.json").body
    # @employee = Employee.new(employee_hash)

  end

  def new

  end

  def create
    @employee = Unirest.post("#{ENV['API_BASE_URL']}/employees.json", headers:{ "Accept" => "application/json" }, parameters:{ first_name: params[:first_name], last_name: params[:last_name], email: params[:email]}).body
    redirect_to "/employees/#{@employee['id']}"
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
   
    redirect_to "/employees"
  end
end
