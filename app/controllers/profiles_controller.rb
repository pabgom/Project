class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!

  respond_to :html

  def index
		redirect_to '/myprofile'
    #@profiles = Profile.all
    #respond_with(@profiles)
  end

  def show
    respond_with(@profile)
  end

  def new
    #@profile = Profile.new
    #respond_with(@profile)
		@user = User.find(current_user.id)
		@profile = Profile.new
 		@profile.user_id = @user.id
 		respond_with(@profile)
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.save
    respond_with(@profile)
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end
	
	def myprofile
		 profile = Profile.find_by_user_id(current_user.id)
		 print current_user.id
		 if profile.nil?
		 		redirect_to "/profiles/new"
		 else
			 @user = User.find(current_user.id)
			 @profile = Profile.find_by_user_id(@user.id)
			 #redirect_to "/profiles/#{@profile.id}"
		 end
 	end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:user_id, :name, :address, :phone, :dob)
    end
end
