class ProfileController < ApplicationController
  # All actions in this controller require the presence of an authenticated user.
  before_filter :authenticate_user!

  # GET /twets
  #
  # This action uses the #get_twets method to set the @twets instance variable.
  #
  #   @twets # => All twets defaultly shown to the authenticated user.
  #
  def index
    username = params[:profilename]
    user_object = User.find_by_username(username)
    get_profile(user_object)    
  end

  def get_profile(user_object)
    @profilename = user_object.profile
  end
  
  # POST /twets
  #
  # Used to create a new twet for the authenticated user based on the data passed
  # in params[:twet]. If the twet is created successfully, a success message is
  # set and we are directed to the index action. Otherwise, an error message is set,
  # the twets visible to the authenticated user are loaded into @twets and the index
  # view template is displayed.
  #
  #   @twet # => The newly created (or attempted) twet.
  #   @twets # => (only set if the twet was not created) All twets defaultly shown
  #                to the authenticated user.
  #
  #
  

  
  
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
