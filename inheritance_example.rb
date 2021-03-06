class Vehicle
  def initialize
    @speed = 0
    @direction = 'north'
  end

  def brake
    @speed = 0
  end

  def accelerate
    @speed += 10
  end

  def turn(new_direction)
    @direction = new_direction
  end
end

class Car < Vehicle
  def initialize(input_make, input_model)
    super()
    @make = input_make
    @model = input_model
  end

  def honk_horn
    puts "Beeeeeeep!"
  end
end

class Bike < Vehicle
  def ring_bell
    puts "Ring ring!"
  end
end

my_car = Car.new("Ford", "Explorer")
p my_car
my_car.accelerate
p my_car
my_car.honk_horn

my_bike = Bike.new()
p my_bike
my_bike.accelerate
p my_bike
my_bike.ring_bell
