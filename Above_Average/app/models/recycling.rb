class Recycling < ActiveRecord::Base

	validates :local, :compost, :fabric, :ewaste, numericality: true

	before_save :aggregate

	belongs_to :user

	def aggregate
		self.total = self.local + self.compost + self.fabric + self.ewaste
	end


# Descriptions of values for the recycling form.
	def recyclings_local_100
		recyclings_local_100 = "I never waste anything.  When I use a plastic bottle, I’ll carry it around with me until it can be properly recycled.  I won’t use a garbage receptacles that says: ‘Contents Sorted and Recycled’ unless I research the validity of the claim first, and verify the quality of the recycling process."
	end

	def recyclings_local_80
		recyclings_local_80 = "I follow the local rules to the letter in my own home.  Occasionally, when I’m out and about, I’ll use the trash can.  I trust the documentation that the city/state provides, and assume that everything gets to the best place."
	end

	def recyclings_local_60
		recyclings_local_60 = "I could do better, but I could totally do worse.  I don’t sweat using the garbage, but keep things separate around the house.  Sometimes if a container has been in the refrigerator too long, I’ll toss it instead of cleaning it out and recycling."
	end

	def recyclings_local_40
		recyclings_local_40 = "I don’t think about it too much.  It’s a connivence thing.  If I have the opportunity I will totally recycle."
	end

	def recyclings_local_20
		recyclings_local_20 = "Ugh.  It’s kinda a hassle.  I try to get the big stuff, but don’t sweat it."
	end

	def recyclings_local_0
		recyclings_local_0 = "Does not apply to me, because I never use anything.  I've never read a newspaper, eaten take-out, or purchased anything that comes in no biodegradable packaging.  When I need a temporary container, I make it out of hair and fingernails."
	end



	def recyclings_compost_100
		recyclings_compost_100 = "I compost all my food scraps."
	end

	def recyclings_compost_80
		recyclings_compost_80 = "I do pretty well.  But sometimes it’s a hassle."
	end

	def recyclings_compost_60
		recyclings_compost_60 = "It’s kinda smelly, but when I have to time, I bring some  scraps to the farmers market.  They have a small bin for deposits."
	end

	def recyclings_compost_40
		recyclings_compost_40 = "I mostly use all the food I buy.  I try to freeze things before they go bad, or sauté things all together, or blend questionable fruit in a smoothy.  Sometimes the dog gets the leftovers."
	end

	def recyclings_compost_20
		recyclings_compost_20 = "Wait what’s this?  I think composted my food in San Francisco."
	end

	def recyclings_compost_0
		recyclings_compost_0 = "Doesn’t apply to me, because I eat all my food all the time."
	end



	def recycling_fabric_100
		recyclings_fabric_100 = "All my old clothes are donated to a responsible organization.  Sheets and towels are brought to a recycling center and reused.  I like to reuse old fabric in creative ways."
	end

	def recycling_fabric_80
		recyclings_fabric_80 = "Most of my clothes are donated.  I try to recycle other types of fabric, but the recycling center only accepts fabric a few times a year, and last time I forgot."
	end

	def recycling_fabric_60
		recyclings_fabric_60 = "I like to donate or give any most of my clothes.  But I don’t worry about sheets and towels or any of the things that goodwill won’t accept."
	end

	def recycling_fabric_40
		recyclings_fabric_40 = "Most of the time I donate my old clothes and give the things I don’t use to friends or family.  The last time I moved, I didn’t have time and a lot of stuff ended up in the garbage."
	end

	def recycling_fabric_20
		recyclings_fabric_20 = "You can recycle fabric?"
	end

	def recycling_fabric_0
		recyclings_fabric_0 = "Doesn’t apply to me, because I’m a nudist and I don’t use blankets, towels, or any kind of furniture that is made with fabric."
	end



	def recycling_ewaste_100
		recycling_ewaste_100 = "Every bit of e-waste is sold or recycled.  Not a single drop of heavy metal is mishandled."
	end

	def recycling_ewaste_80
		recycling_ewaste_80 = "I may hang on to old stuff for a while, but I try to get it sorted across the different concerns as quickly as possible.  Occasionally a battery may get tossed."
	end

	def recycling_ewaste_60
		recycling_ewaste_60 = "I have a pile of old stuff in an drawer.  It’s on my list of things to do, and most of the time I get to it."
	end

	def recycling_ewaste_40
		recycling_ewaste_40 = "I like to get some money for my old tech, but all the worthless stuff like batteries and printer cartridges are stupid."
	end

	def recycling_ewaste_20
		recycling_ewaste_20 = "I don’t sweat it.  It goes into the garbage or I give my old stuff away."
	end

	def recycling_ewaste_0	
		recycling_ewaste_0 = "Doesn’t apply to me, because I’m a luddite.  I’m not using a computer right now."
	end

end

