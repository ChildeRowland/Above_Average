class Recycling < ActiveRecord::Base

	belongs_to :user


	def recyclings_local_100
		recyclings_local_100 = "I never waste anything.  When I use a plastic bottle, I’ll carry it around with me until it can be properly recycled.  I won’t use a garbage receptacles that says: ‘Contents Sorted and Recycled’ unless I research the validity of the claim first, and verify the quality of the recycling process."
	end

	def recyclings_local_80
		recyclings_local_80 = "I follow the local rules to the letter in my own home.  Occasionally, when I’m out and about, I’ll use the trash can.  I trust the documentation that the city/state provides, and assume that everything gets to the best place."
	end

	def recyclings_local_60
		recyclings_local_60 = "I could do better, but I could totally do worse.  I don’t sweet using the garbage, but keep things separate around the house.  Sometimes if a container has been in the refrigerator too long, I’ll toss it instead of cleaning it out and recycling."
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
		recyclings_compost_100 = ""
	end

end

=begin
	
	def recyclings_descriptions(symbol, value)
		
	end

	
=end
