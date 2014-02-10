class Accounts::UsersController < AccountsController
  before_action :verify_deletability, only: [:destroy]
  before_action :verify_editability, only: [:edit, :update]
  before_action :verify_lodge_ability, only: [:create, :new]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /u/dashboard
  def dashboard

  end

  # GET /:sub_domain/users
  # GET /:sub_domain/users.json
  def index
    @users = current_lodge.members.order("last_name asc")
  end

  # GET /:sub_domain/users/1
  # GET /:sub_domain/users/1.json
  def show
  end

  # GET /:sub_domain/users/new
  def new
    @user = User.new
  end

  # GET /:sub_domain/users/1/edit
  def edit
  end

  # POST /:sub_domain/users
  # POST /:sub_domain/users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to lodge_users_path(current_lodge.sub_domain), notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /:sub_domain/users/1
  # PATCH/PUT /:sub_domain/users/1.json
  def update
    respond_to do |format|
      if @user.update(params[:user])
        format.html { redirect_to lodge_users_path(current_lodge.sub_domain), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /:sub_domain/users/1
  # DELETE /:sub_domain/users/1.json
  def destroy
    # if the user is a plural member,
    # only delete the association
    if @user.memberships.count > 1
      @user.memberships.find_by_lodge_id(current_lodge).destroy
    else
      @user.destroy
    end
    respond_to do |format|
      format.html { redirect_to lodge_users_path(current_lodge.sub_domain), notice: 'User was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def verify_deletability
    if current_user.id == params[:id].to_i
      return redirect_to lodge_users_path(current_lodge.sub_domain), error: "Opps. You can't delete yourself."
    end
    raise ApplicationController::Unauthorized unless current_user.can_admin?(current_lodge)
  end

  def verify_editability
    unless current_user.id == params[:id].to_i || current_user.can_admin?(current_lodge)
      raise ApplicationController::Unauthorized
    end
  end

  def verify_lodge_ability
    raise ApplicationController::Unauthorized unless current_user.can_admin?(current_lodge)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    # FIXME
    #   - might want to scope this down to the current_lodge
    #   - if so, be sure to rescure from potental ActiveRecord::RecordNotFound
    # @user = current_lodge.members.find(params[:id])
    @user = User.find(params[:id])
  end

end
