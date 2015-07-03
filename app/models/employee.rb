class Employee

  # attr_accessor :first_name, :last_name, :email, :birthdate, :addresses

  def initialize(hash)
    # hash == {"first_name" => "Jill", "last_name" => "Watson"}
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @email = hash["email"]
    @birthdate = hash["birthdate"]
    @addresses = hash["addresses"]
  end

  def full_name
    "#{@first_name} #{@last_name}"
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