class GraphsController < ApplicationController
	def index

		
#users
		@users = User.all 
		@user = current_user

		if @user.profiles.empty?
			redirect_to "/fill-out-profile"
		end
		
	


		# @profile = @user.profiles
	 	@profiles = Profile.all
		@profile = Profile.last(params[:profile])
		
		@utility = @user.utilities
		@utilities = Utility.all
		
		@recycling = @user.recyclings
		@recyclings = Recycling.all
#profile
		@average_age = Profile.average(:age)
		@average_total_household_members = Profile.average(:total_household_members)
		@average_zip = Profile.average(:zip)
#utlity
		@average_kwh = Utility.average(:kwh)
		@average_therms = Utility.average(:therms)
		@average_gallons = Utility.average(:gallons)
#recycling
		@average_local = Recycling.average(:local)
		@average_compost = Recycling.average(:compost)
		@average_fabric = Recycling.average(:fabric)
		@average_ewaste = Recycling.average(:ewaste)
# commuting
		# @average_local = Recycling.average(:local)
		# @average_compost = Recycling.average(:compost)
		# @average_fabric = Recycling.average(:fabric)
		# @average_ewaste = Recycling.average(:ewaste)

	end

#to show results of other users questions, use .count with a group.

	def group_by_day

	end

#paste to punchlist: 
#compare current user to self over time across all data
#compare all users data compare to all other users data 
#compare against user


end
