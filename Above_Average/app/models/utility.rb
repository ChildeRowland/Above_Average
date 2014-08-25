class Utility < ActiveRecord::Base

	validates :kwh, :therms, :gallons, numericality: true#, :message => "Numbers only please, no decimals."

	before_save :normalize, :aggregate

	belongs_to :user

	KWH_TONS_CO2 = 0.0008
	THERMS_TONS_CO2 = 0.006
	GALLONS_TONS_CO2 = 0.005

	private

	def normalize

		p = user.profiles.last.total_household_members

		self.normalized_kwh = self.kwh / p * KWH_TONS_CO2
		self.normalized_therms = self.therms / p * THERMS_TONS_CO2
		self.normalized_gallons = self.gallons / p * GALLONS_TONS_CO2
 	end

 	def aggregate
 		self.total = self.normalized_therms + self.normalized_kwh + self.normalized_gallons
 	end

end

# / User.find(params[:user_id]).profiles.last.total_household_members
