class UtilitiesController < ApplicationController

	def new
		@user = current_user
		@utility = @user.utilities.build(params[:utility])
	end

	def create
		@user = current_user
		@utility = @user.utilities.build(utility_params)
		if @utility.save
			redirect_to user_path @current_user
		else
			redirect_to :back
		end
	end

	private
	def utility_params
		params.require(:utility).permit(:kwh, :therms, :gallons)
	end

end
