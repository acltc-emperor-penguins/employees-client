class Employee

  attr_accessor :first_name, :last_name, :email, :birthdate, :addresses, :id

  def initialize(hash)
    # hash == {"first_name" => "Jill", "last_name" => "Watson"}
    @id = hash["id"]
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @email = hash["email"]
    @birthdate = hash["birthdate"]
    @addresses = hash["addresses"]
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def self.find(id)
    employee_hash = Unirest.get("#{ENV['API_BASE_URL']}/employees/#{id}.json", headers:{ "Accept" => "application/json", "Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => "#{ENV['API_EMAIL']}" }).body
    Employee.new(employee_hash)
  end

  def self.all
    employees = []
    employee_hashes = Unirest.get("#{ENV['API_BASE_URL']}/employees.json", headers:{ "Accept" => "application/json", "Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => "#{ENV['API_EMAIL']}" }).body
    employee_hashes.each do |hash|
      employees << Employee.new(hash)
    end
    employees
  end

  def destroy
    Unirest.delete("#{ENV['API_BASE_URL']}/employees/#{id}.json", headers:{ "Accept" => "application/json", "Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => "#{ENV['API_EMAIL']}" }).body
  end

  # def first_name
  #   @first_name
  # end

  # def first_name=(name)
  #   @first_name = name
  # end

  # employee = Employee.new("Jill")
  # employee.first_name
  # employee.first_name = "Jilll"





end