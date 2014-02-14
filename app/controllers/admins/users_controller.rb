class Admins::UsersController < AdminsController
  before_action :set_saas_admin, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def dashboard

  end

  # GET /a/users
  # GET /a/users.json
  def index
    @saas_admins = Admin.all
  end

  # GET /a/users/1
  # GET /a/users/1.json
  def show
  end

  # GET /a/users/new
  def new
    @saas_admin = Admin.new
  end

  # GET /a/users/1/edit
  def edit
  end

  # POST /a/users
  def create
    @saas_admin = Admin.new(params[:admin])
    flash[:notice] = 'SaaS Admin was successfully created.' if @saas_admin.save
    respond_with @saas_admin, location: admin_users_path
  end

  # PATCH/PUT /a/users/1
  def update
    flash[:notice] = 'SaaS Admin was successfully updated.' if @saas_admin.update(params[:admin])
    respond_with @saas_admin, location: admin_users_path
  end

  # DELETE /a/users/1
  def destroy
    @saas_admin.destroy
    redirect_to admin_users_path
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_saas_admin
      @saas_admin = Admin.find(params[:id])
    end

end
