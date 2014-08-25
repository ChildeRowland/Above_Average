class TravelsController < ApplicationController

	def new
		@user = current_user
		@travel = @user.travels.build(params[:travel])
	end


	# number_string = params[:distance_comma_separated]

	# walk_list = number_string.split(',')
	# total = 0
	# 	walk_list.each do |num|
 #  			total += num
	# 	end
	
	# walk = total
	# walk.save


	def create
		@user = current_user
		@travel = @user.travels.build(travel_params)
		if @travel.save
			redirect_to user_path @current_user
		else
			redirect_to :back
		end
	end

	private
	def travel_params
		params.require(:travel).permit(:walk, :train, :bus, :car, :plane)
	end

end
