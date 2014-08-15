class ProfilesController < ApplicationController

  def edit
  end

  def new
    @user = current_user
    @profile = @user.profile.build(params_profile)
  end

  def create
    @user = current_user
    @profile = @user.profile.build(params_profile)
      if @profile.save
        redirect_to user_path
      else
        redirect_to :back
      end
  end

  def show
  end

  def index
  end

  def update
  end

  def destroy
  end

  private
  def params_profile
    params.require(:profile).permit(:age, :zip, :total_household_members, :fname)
  end

end
