class TravelsController < ApplicationController

	def new
		@user = current_user
		@travel = @user.travels.build(params[:travel])
	end

	def create
		@user = current_user
		@travel = @user.travels.build(travel_params)
		@travel.walk_string = params[:travel][:walk]
		@travel.bicycle_string = params[:travel][:bicycle]
		@travel.train_string = params[:travel][:train]
		@travel.bus_string = params[:travel][:bus]
		@travel.car_string = params[:travel][:car]
		@travel.plane_string = params[:travel][:plane]
		if @travel.save 
			flash[:notice] = "Info submited, thanks!"
			redirect_to user_path @current_user
		else
			flash[:notice] = "Something went wrong, please try again."
			redirect_to :back
		end
	end

	private
	def travel_params
		params.require(:travel).permit(:walk, :bicycle, :train, :bus, :car, :plane)
	end

end
