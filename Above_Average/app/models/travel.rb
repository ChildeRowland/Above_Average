class Travel < ActiveRecord::Base

	validates :walk, :train, :bus, :car, :plane, numericality: true

	before_save :normalize

	before_save :aggregate

	belongs_to :user

	WALK_TONS_CO2 = 0
	TRAIN_TONS_CO2 = 0.000165
	BUS_TONS_CO2 = 0.00033
	CAR_TONS_CO2 = 0.00042
	PLANE_TONS_CO2 = 0.0005

	private

	def normalize
		self.normalized_walk = self.walk * WALK_TONS_CO2
		self.normalized_train = self.train * TRAIN_TONS_CO2
		self.normalized_bus = self.bus * BUS_TONS_CO2
		self.normalized_car = self.car * CAR_TONS_CO2
		self.normalized_plane = self.plane * PLANE_TONS_CO2

	end

	def aggregate
		self.total = self.normalized_walk + self.normalized_train + self.normalized_bus + self.normalized_car + self.normalized_plane
	end

end

=begin 

tons CO2 per mile

plane = 0.0005
car = 0.00042
bus = 0.00033
train = 0.000165
walk = 0

=end