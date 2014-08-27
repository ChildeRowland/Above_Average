class Utility < ActiveRecord::Base

	validates :kwh,
		:numericality =>
		{:message => "Numbers only please, no decimals."}

	validates :therms,
		:numericality =>
		{:message => "Numbers only please, no decimals."}

	validates :gallons,
		:numericality =>
		{:message => "Numbers only please, no decimals."}


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

# / User.find(params[:user_id]).profiles.last.total_household_members
