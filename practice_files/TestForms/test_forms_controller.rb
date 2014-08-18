class TestFormsController < ApplicationController

	def new
		@user = current_user
		@test_form = @user.test_forms.build(params[:test_form])
	end

	def create
		@user = current_user
		@test_form = @user.test_forms.build(test_form_params)
		if @test_form.save
			redirect_to user_path @current_user
		end
	end

	def show
	end

	private
	def test_form_params
		params.require(:test_form).permit(:stop_bank_robbers, :love_litter, :inverse_statement)
	end

end
