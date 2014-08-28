class Travel < ActiveRecord::Base
	
	validates :walk,
		:inclusion => { :in => 0..1000000, :message => "numbers only please, no decimals or symbols"},
		:exclusion => { :in => -1000000..-1, 
			:message => "No negitive values please."}

	validates :bicycle,
		:inclusion => { :in => 0..1000000, :message => "numbers only please, no decimals or symbols"},
		:exclusion => { :in => -1000000..-1, 
			:message => "No negitive values please."}

	validates :train,
		:inclusion => { :in => 0..1000000, :message => "numbers only please, no decimals or symbols"},
		:exclusion => { :in => -1000000..-1, 
			:message => "No negitive values please."}

	validates :bus,
		:inclusion => { :in => 0..1000000, :message => "numbers only please, no decimals or symbols"},
		:exclusion => { :in => -1000000..-1, 
			:message => "No negitive values please."}

	validates :car,
		:inclusion => { :in => 0..1000000, :message => "numbers only please, no decimals or symbols"},
		:exclusion => { :in => -1000000..-1, 
			:message => "No negitive values please."}

	validates :plane,
		:inclusion => { :in => 0..1000000, :message => "numbers only please, no decimals or symbols"},
		:exclusion => { :in => -1000000..-1, 
			:message => "No negitive values please."}
		

	# validates_format_of

	# validates :walk, 
	# 	:numericality => {:message => "Numbers only please, no decimals."}

	# validates :bicycle, 
	# 	:numericality => {:message => "Numbers only please, no decimals."}

	# validates :train, 
	# 	:numericality => {:message => "Numbers only please, no decimals."}

	# validates :bus, 
	# 	:numericality => {:message => "Numbers only please, no decimals."}

	# validates :car, 
	# 	:numericality => {:message => "Numbers only please, no decimals."}

	# validates :plane, 
	# 	:numericality => {:message => "Numbers only please, no decimals."}

	
	attr_accessor :walk_string
	attr_accessor :bicycle_string
	attr_accessor :train_string
	attr_accessor :bus_string
	attr_accessor :car_string
	attr_accessor :plane_string

	before_save :sum_walked_distance
	before_save :sum_bicycle_distance
	before_save :sum_train_distance
	before_save :sum_bus_distance
	before_save :sum_car_distance
	before_save :sum_plane_distance

	before_save :normalize
	before_save :aggregate

	belongs_to :user

	WALK_POUNDS_CO2 = 0
	BICYCLE_POUNDS_CO2 = 0
	TRAIN_POUNDS_CO2 = 0.33
	BUS_POUNDS_CO2 = 0.66
	CAR_POUNDS_CO2 = 0.84
	PLANE_POUNDS_CO2 = 1.0

	private

	def sum_walked_distance
		walk_list = self.walk_string.split(" ")
		total = 0
		walk_list.each do |num|
  			total += num.to_f
		end
      	self.walk = total / 5280
	end

	def sum_bicycle_distance
		bicycle_list = self.bicycle_string.split(" ")
		total = 0
		bicycle_list.each do |num|
  			total += num.to_i
		end
      	self.bicycle = total
	end

	def sum_train_distance
		train_list = self.train_string.split(" ")
		total = 0
		train_list.each do |num|
  			total += num.to_i
		end
      	self.train = total
	end

	def sum_bus_distance
		bus_list = self.bus_string.split(" ")
		total = 0
		bus_list.each do |num|
  			total += num.to_i
		end
      	self.bus = total
	end

	def sum_car_distance
		car_list = self.car_string.split(" ")
		total = 0
		car_list.each do |num|
  			total += num.to_i
		end
      	self.car = total
	end

	def sum_plane_distance
		plane_list = self.plane_string.split(" ")
		total = 0
		plane_list.each do |num|
  			total += num.to_i
		end
      	self.plane = total
	end

	def normalize
		self.normalized_walk = self.walk * WALK_POUNDS_CO2
		self.normalized_bicycle = self.bicycle * BICYCLE_POUNDS_CO2
		self.normalized_train = self.train * TRAIN_POUNDS_CO2
		self.normalized_bus = self.bus * BUS_POUNDS_CO2
		self.normalized_car = self.car * CAR_POUNDS_CO2
		self.normalized_plane = self.plane * PLANE_POUNDS_CO2
	end

	def aggregate
		self.total = self.normalized_walk + self.normalized_bicycle + self.normalized_train + self.normalized_bus + self.normalized_car + self.normalized_plane
	end

end