class ProfilesController < ApplicationController

  def new
    @user = current_user
    @profile = @user.profiles.build(params[:profile])
  end

  def create
    @user = current_user
    @profile = @user.profiles.build(profile_params)
      if @profile.save
        flash[:notice] = "Info submited, thanks!"
        redirect_to user_path @current_user
      else
        flash[:notice] = "Something went wrong, but you can make these changes and try again:"
        render :new
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
