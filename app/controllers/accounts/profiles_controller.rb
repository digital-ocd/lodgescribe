class Accounts::ProfilesController < AccountsController
  before_action :set_form, only: [:edit, :update]

  respond_to :html, :json

  # GET /u/profile
  # GET /u/profile.json
  def show
    @user = current_user
  end

  # GET /u/profile/edit
  def edit
  end

  # PATCH/PUT /u/profile
  # PATCH/PUT /u/profile.json
  def update
    flash[:notice] = "Profile was successfully updated." if @user.submit(params[:user])
    respond_with @user, location: edit_user_profile_path
  end

  private

  def set_form
    @user = UpdateUserProfileForm.new(current_user)
  end
end
