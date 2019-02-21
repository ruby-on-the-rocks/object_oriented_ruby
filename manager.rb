require "./employee.rb"
require "./email_reportable.rb"

module Actualize
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
end
