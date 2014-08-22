class Utility < ActiveRecord::Base

	before_save :normalize, :aggregate

	belongs_to :user

	KWH_TONS_CO2 = 0.0008
	THERMS_TONS_CO2 = 0.006
	GALLONS_TONS_CO2 = 0.005

	private
	def normalize
		self.normalized_kwh = self.kwh * KWH_TONS_CO2
		self.normalized_therms = self.therms * THERMS_TONS_CO2
		self.normalized_gallons = self.gallons * GALLONS_TONS_CO2
 	end

 	def aggregate
 		self.total = self.normalized_therms + self.normalized_kwh
 	end

end
