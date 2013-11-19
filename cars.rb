

class Car
	@@total_car_count = 0
	@@most_popular_color = nil
	@@cars_per_color = {}
	@@car_prices={}
	@@most_expensive_car = 0


	attr_accessor :roof_status

	def to_s()
		"I'm a #{@color} car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize(color,price)
		@fuel = 10
		@distance = 0
		@color=color
		@price=price

		addCarColor
		@@total_car_count+=1
		addCarPrice

	end




	def addCarPrice
		@@car_prices[self]=@price
	end

	def self.most_expensive_car
		
		temp = 0
		@@car_prices.each do |key, value|
			puts key
			if(value> temp )
				temp = value

			end
		end

		@@most_expensive_car = temp
	end



	def addCarColor
		if @@cars_per_color.has_key?(@color) 
			@@cars_per_color[@color] += 1
		else
			@@cars_per_color[@color] = 1
		end
	end

	def removeCarColor
		if @@cars_per_color.has_key?(@color) 
			@@cars_per_color[@color] -= 1
		else
			puts "Error"
		end
	end

	def color=(newColor)
		removeCarColor  #removes the current car color from the cars_per_color hash
		@color = newColor
		addCarColor		#adds the newly updated car color to the cars_per_color hash
	end


	def self.cars_per_color
		@@cars_per_color
	end


	def self.total_car_count
		@@total_car_count
	end

	def self.most_popular_color
		tempColor = [nil, 0]
		@@cars_per_color.each do |color, number|
			if number > tempColor[1]
				tempColor[0] = color
			end
		end

		@@most_popular_color = tempColor[0]

	end



	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end


end

class ConvertibleCar < Car

	def initialize(color, price)
		super(color, price)
		@convertible = true
		@roof_status = "closed"
	end


	def top_down 
		if @convertible == true
			@roof_status = "open"
		end
	end

	def close_top 
		if @convertible == true
			@roof_status = "closed"
		end
	end
	

end

car_a = ConvertibleCar.new("Red", 17000)
car_a.fuel_up
car_b = Car.new("Blue", 24234234)
 puts car_a.roof_status
car_a.top_down
puts car_a.roof_status
 puts ConvertibleCar.most_expensive_car

#puts car_a.methods


# # car_a = Car.new()
# # car_b = Car.new()
# # puts car_a
# # puts car_b
# # car_a.drive(10)
# # puts car_a
# # puts car_b
# # car_a.drive(232)
# # car_b.drive(117)
# # puts car_a
# # puts car_b
# # puts Car.total_car_count
# # c1=Car.new
# # puts Car.total_car_count
# # c2=Car.new
# # puts Car.total_car_count
# # puts Car.total_car_count
#  # c = Car.new
#  # c.drive(10)
# best_color = Car.most_popular_color
# puts best_color
 
#  c1 = Car.new("Blue", 20000, true)
#  c2 = Car.new("Blue", 12000, false)
#  c3 = Car.new("Blue", 18000, false)
# c4 = Car.new("Green", 20000, true)

# puts Car.cars_per_color

# # c3.color=("Green", 12000)
# puts Car.cars_per_color

# c5 = Car.new("Green",12000, true)
# puts Car.cars_per_color

# puts Car.most_popular_color

# c6 = Car.new(Car.most_popular_color, Car.most_expensive_car, true)
# puts Car.cars_per_color

# puts Car.most_expensive_car


# puts c1.roof_status
# c1.top_down
# puts c1.roof_status
# c1.close_top
# puts c1.roof_status

# puts c2.roof_status
# c2.top_down
# puts c2.roof_status


