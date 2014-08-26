class GraphsController < ApplicationController
	def index

		
#users
		@users = User.all 
		@user = current_user

		if @user.profiles.empty?
			flash[:notice] = "Please complete a User Profile to continue"
			redirect_to new_user_profile_path
		end

		if @user.utilities.empty?
			flash[:notice] = "Please complete the Utilities survey to continue"
			redirect_to new_user_utility_path
		end
		
		if @user.recyclings.empty?
			flash[:notice] = "Please complete the Recycling survey to continue"
			redirect_to new_user_recycling_path
		end

		# if @user.travels.empty?
		# 	flash[:notice] = "Please complete the Travel survey to continue"
		# 	redirect_to new_user_travel_path
		# end
	

		# @profile = @user.profiles
	 	@profiles = Profile.all
		@profile = Profile.last(params[:profile])
		
		@utility = @user.utilities
		@utilities = Utility.all
		
		@recycling = @user.recyclings
		@recyclings = Recycling.all

		# @travel = @user.travels
		# @travels = Travel.all
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



# travel
		# @average_? = Travel.average(:local)
		# @average_? = Travel.average(:compost)
		# @average_fabric = Travel.average(:fabric)
		# @average_ewaste = Travel.average(:ewaste)

	end

	#failed attempts at translating integers into strings for use output
		# if @recycling.compost = 50
		# 	puts "rarely"
		# end

		# if
	# 	@user.recyclings.where("compost" < 100)
	# 	puts "rarely"
	# end

#to show results of other users questions, use .count with a group.

	def group_by_day

	end

	# if
	# 	@user.recyclings.where("compost" < 100)
	# 	puts "rarely"
	# end




end
