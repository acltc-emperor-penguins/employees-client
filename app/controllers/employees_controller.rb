class EmployeesController < ApplicationController
  
  def index
    @employees = Employee.all
    # @employees = []
    # employee_hashes = Unirest.get("http://localhost:3000/employees.json").body
    # employee_hashes.each do |hash|
    #   @employees << Employee.new(hash)
    # end
  end

  def show
    @employee = Employee.find(params[:id])

    # @employee = Employee.new({"first_name" => "Jill", "last_name" => "Watson"})
  end

  def new

  end

  def create
    @employee = Unirest.post("http://localhost:3000/employees.json", headers:{ "Accept" => "application/json" }, parameters:{ first_name: params[:first_name], last_name: params[:last_name], email: params[:email]}).body
    redirect_to "/employees/#{@employee['id']}"
  end

  def destroy
    @employee = Unirest.delete("http://localhost:3000/employees/#{params[:id]}.json", headers:{ "Accept" => "application/json" }).body
    redirect_to "/"
  end
end
