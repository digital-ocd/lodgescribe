class Accounts::ProfilesController < AccountsController
  before_action :set_profile, only: [:show, :edit, :update]

  respond_to :html, :json

  # GET /u/profile
  # GET /u/profile.json
  def show
  end

  # GET /u/profile/edit
  def edit
  end

  # PATCH/PUT /u/profile
  # PATCH/PUT /u/profile.json
  def update
    flash[:notice] = "Profile was successfully updated." if @profile.update(params[:profile])
    respond_with @profile, location: edit_user_profile_path
  end

  private

    def set_profile
      @profile = current_user.profile
    end
end
