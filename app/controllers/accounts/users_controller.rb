class Accounts::UsersController < AccountsController
  before_action :set_user, only: [:show, :edit, :update]

  respond_to :html, :json

  # GET /u/dashboard/1
  # GET /u/dashboard/1.json
  def dashboard
  end

  # GET /u/profile/1
  # GET /u/profile/1.json
  def show
  end

  # GET /u/profile/edit
  def edit
  end

  # PATCH/PUT /u/profile/1
  # PATCH/PUT /u/profile/1.json
  def update
    if @user.update_with_password(params[:user])
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true if @user.id == current_user.id
      flash[:notice] = "User was successfully updated."
    end
    respond_with @user, location: user_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

end
