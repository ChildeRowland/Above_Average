class ProfilesController < ApplicationController

  def new
    @user = current_user
    @profile = @user.profiles.build(params[:profile])
  end

  def create
    @user = current_user
    @profile = @user.profiles.build(profile_params)
      if @profile.save
        redirect_to user_path @current_user
      else
        redirect_to :back
      end
  end

  def edit
    @user = current_user
    @profile = @user.profiles.last
  end

  def update
    @user = current_user
    @profile = @user.profiles.last
    if @profile.update_attributes(profile_params)
      redirect_to user_path @current_user
    else
      redirect_to :back
    end
  end

  # def show
  # end

  # def index
  # end

  # def destroy
  # end

  private
  def profile_params
    params.require(:profile).permit(:age, :zip, :total_household_members, :fname)
  end

end
