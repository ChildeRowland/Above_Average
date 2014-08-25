class TravelsController < ApplicationController

	def new
		@user = current_user
		@travel = @user.travels.build(params[:travel])
	end

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
