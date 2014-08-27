class UtilitiesController < ApplicationController

	def new
		@user = current_user
		@utility = @user.utilities.build(params[:utility])
	end

	def create
		@user = current_user
		@utility = @user.utilities.build(utility_params)
		if @utility.save
			flash[:notice] = "Info submited, thanks!"
			redirect_to user_path @current_user
		else
			flash[:notice] = "Something went wrong, but you can make these changes and try again:"
			render :new
		end
	end

	private
	def utility_params
		params.require(:utility).permit(:kwh, :therms, :gallons)
	end

end
