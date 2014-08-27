class Utility < ActiveRecord::Base

	validates :kwh,
		:exclusion => { :in => -10000..-1, 
			:message => "No negitive values please."},
		:numericality =>
		{:message => "Kilo Watts per Hour requires numbers please, no decimals."}

	validates :therms,
		:exclusion => { :in => -10000..-1, 
			:message => "No negitive values please."},
		:numericality =>
		{:message => "Therms in numbers only please, no decimals."}

	validates :gallons,
		:exclusion => { :in => -10000..-1, 
			:message => "No negitive values please."},
		:numericality =>
		{:message => "Gallons in numbers only please, no decimals."}


	before_save :normalize, :aggregate

	belongs_to :user

	KWH_POUNDS_CO2 = 1.6
	THERMS_POUNDS_CO2 = 12
	GALLONS_POUNDS_CO2 = 10

	private

	def normalize

		p = user.profiles.last.total_household_members

		self.normalized_kwh = self.kwh / p * KWH_POUNDS_CO2
		self.normalized_therms = self.therms / p * THERMS_POUNDS_CO2
		self.normalized_gallons = self.gallons / p * GALLONS_POUNDS_CO2
 	end

 	def aggregate
 		self.total = self.normalized_therms + self.normalized_kwh + self.normalized_gallons
 	end

end
