class Employee
  attr_reader :first_name, :last_name, :active
  attr_writer :active, :first_name

  def initialize(input_options_hash)
    @first_name = input_options_hash[:first_name]
    @last_name = input_options_hash[:last_name]
    @salary = input_options_hash[:salary]
    @active = input_options_hash[:active]
  end

  def print_info
    puts "#{@first_name} #{@last_name} makes #{@salary} a year."
  end

  def give_annual_raise
    @salary = 1.05 * @salary
  end
end

class Manager < Employee
  def initialize(input_options_hash)
    super(input_options_hash)
    @employees = input_options_hash[:employees]
  end

  def send_report
    puts "Sending email..."
    # Code to send actual email...
    puts "Email sent!"
  end
end

employee1 = Employee.new({first_name: "Majora", last_name: "Carter", salary: 80000, active: true})
employee2 = Employee.new(salary: 70000, first_name: "Danilo", last_name: "Campos", active: true)

manager = Manager.new(first_name: "Saron", last_name: "Yitbarek", salary: 100000, active: true, employees: [employee1, employee2])
p manager.first_name
manager.send_report
p manager
