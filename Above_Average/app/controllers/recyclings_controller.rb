class RecyclingsController < ApplicationController

	def new
		@user = current_user
		@recycling = @user.recyclings.build(params[:recycling])
	end

	def create
		@user = current_user
		@recycling = @user.recyclings.build(recycling_params)
		if @recycling.save
			redirect_to user_path @current_user
		else
			redirect_to :back
		end
	end

	private
	def recycling_params
		params.require(:recycling).permit(:local, :compost, :fabric, :ewaste)
	end

end
