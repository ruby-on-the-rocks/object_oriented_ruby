module EmailReportable
  def send_report
    puts "Sending email..."
    # Code to send actual email...
    puts "Email sent!"
  end
end

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
  include EmailReportable

  def initialize(input_options_hash)
    super(input_options_hash)
    @employees = input_options_hash[:employees]
  end

  def give_all_raises
    puts "Gonna give_all_raises"
    @employees.each do |employee|
      employee.give_annual_raise
    end
  end

  def fire_all_employees
    puts "Gonna fire all employees"
    index = 0
    @employees.length.times do
      employee = @employees[index]
      employee.active = false
      index = index + 1
    end
  end
end

class Intern < Employee
  include EmailReportable
end

employee1 = Employee.new({first_name: "Majora", last_name: "Carter", salary: 80000, active: true})
employee2 = Employee.new(salary: 70000, first_name: "Danilo", last_name: "Campos", active: true)

manager = Manager.new(first_name: "Saron", last_name: "Yitbarek", salary: 100000, active: true, employees: [employee1, employee2])
p manager.first_name
manager.send_report
p manager

manager.give_all_raises
p manager

manager.fire_all_employees
p manager

intern = Intern.new(first_name: "Adrienne", last_name: "Lowe", salary: 50000, active: true)
intern.print_info
intern.send_report
