class ProfileController < ApplicationController
  # All actions in this controller require the presence of an authenticated user.
  before_filter :authenticate_user!


  
  
  def index
    username = params[:profilename]
    user_object = User.find_by_username(username)
    get_profile(user_object)    
  end


  def get_profile(user_object)
    @profilename = user_object.profile
  end
  

  
  
  def create
    @profilename = current_user.username.create(profile_params)
    if @profile.valid?
      flash[:success] = "Your profile was created"
      redirect_to :action => :index and return
    else
      get_profile
      flash[:error] = "Your profile could not be saved"
      render :action => :index and return
    end
  end
  
  
end
