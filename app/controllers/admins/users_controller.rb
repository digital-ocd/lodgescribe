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
    if @saas_admin.save
      redirect_to admin_users_path, notice: 'SaaS Admin was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /a/users/1
  def update
    if @saas_admin.update(params[:admin])
      redirect_to admin_users_path, notice: 'SaaS Admin was successfully updated.'
    else
      render action: 'edit'
    end
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
