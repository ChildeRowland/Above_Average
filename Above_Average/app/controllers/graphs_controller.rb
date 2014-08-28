class GraphsController < ApplicationController
	def master_graph


#users
		@users = User.all 
		@user = current_user

		# if @user.profiles.empty?
		# 	flash[:notice] = "Please complete a User Profile to continue"
		# 	redirect_to new_user_profile_path
		# end

		# if @user.utilities.empty?
		# 	flash[:notice] = "Please complete the Utilities survey to continue"
		# 	redirect_to new_user_utility_path
		# end
		
		# if @user.recyclings.empty?
		# 	flash[:notice] = "Please complete the Recycling survey to continue"
		# 	redirect_to new_user_recycling_path
		# end

		# if @user.travels.empty?
		# 	flash[:notice] = "Please complete the Travel survey to continue"
		# 	redirect_to new_user_travel_path
		# end

		if @user.profiles.empty? || @user.utilities.empty? || @user.recyclings.empty? || @user.travels.empty?

			flash[:notice] = "You have to fill out some surveys before you see the results."
			redirect_to user_path @current_user

		else
	

		# @profile = @user.profiles
	 	@profiles = Profile.all
		@profile = Profile.last(params[:profile])
		
		@utility = @user.utilities
		@utilities = Utility.all
		
		@recycling = @user.recyclings
		@recyclings = Recycling.all

		@travel = @user.travels
		@travels = Travel.all
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
		@average_walk = Travel.average(:walk)
		@average_bicycle = Travel.average(:bicycle)
		@average_train = Travel.average(:train)
		@average_bus = Travel.average(:bus)
		@average_car = Travel.average(:car)
		@average_plane = Travel.average(:plane)
		
# travel totals
		
		@user_average_total_travels = Travel.where('user_id = ?', @user.id).average(:total)
		@user_average_total_utilities = Utility.where('user_id = ?', @user.id).average(:total)
		@CO2 = (@user_average_total_travels + @user_average_total_utilities) 

		@average_total_travels = Travel.average(:total)
		@average_total_utilities = Utility.average(:total)
		@aCO2 = (@average_total_travels + @average_total_utilities) 

		end

		
		

	end

	#failed attempts at translating integers into strings for use output






#to show results of other users questions, use .count with a group.

	def detailed_graphs

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

		if @user.travels.empty?
			flash[:notice] = "Please complete the Travel survey to continue"
			redirect_to new_user_travel_path
		end
	

		# @profile = @user.profiles
	 	@profiles = Profile.all
		@profile = Profile.last(params[:profile])
		
		@utility = @user.utilities
		@utilities = Utility.all
		
		@recycling = @user.recyclings
		@recyclings = Recycling.all

		@travel = @user.travels
		@travels = Travel.all
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
		@average_walk = Travel.average(:walk)
		@average_bicycle = Travel.average(:bicycle)
		@average_train = Travel.average(:train)
		@average_bus = Travel.average(:bus)
		@average_car = Travel.average(:car)
		@average_plane = Travel.average(:plane)
		
# travel totals
		
		@user_average_total_travels = Travel.where('user_id = ?', @user.id).average(:total)
		@user_average_total_utilities = Utility.where('user_id = ?', @user.id).average(:total)
		@CO2 = (@user_average_total_travels + @user_average_total_utilities) 

		@user_average_total_recyclings = Recycling.where('user_id = ?', @user.id).average(:total)
		@average_total_recyclings = Recycling.average(:total)

		@average_total_travels = Travel.average(:total)
		@average_total_utilities = Utility.average(:total)
		@aCO2 = (@average_total_travels + @average_total_utilities) 

		



		end
		def group_by_day

	end

	



end
