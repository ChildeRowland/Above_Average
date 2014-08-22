class GraphsController < ApplicationController
	def index
		@users = User.all 
		@user = current_user
		# @profile = @user.profiles
	 	@profiles = Profile.all
		@profile = Profile.last(params[:profile])
		
		@utility = @user.utility
		@utilities = Utility.all
		
		@recycling = @user.recycling
		@recyclings = Recycling.all

		@average_age = Profile.average(:age)
		@average_total_household_members = Profile.average(:total_household_members)
		@average_zip = Profile.average(:zip)
		

#to show results of other users questions, use .count with a group.
	end

#paste to punchlist: 
#compare current user to self over time across all data
#compare all users data compare to all other users data 
#compare against user


end
