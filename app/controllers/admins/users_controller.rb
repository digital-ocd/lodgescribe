class Admins::UsersController < AdminsController
  before_action :set_saas_admin, only: [:show, :edit, :update, :destroy]
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
  # POST /a/users.json
  def create
    @saas_admin = Admin.new(params[:admin])
    respond_to do |format|
      if @saas_admin.save
        format.html { redirect_to admin_users_path, notice: 'SaaS Admin was successfully created.' }
        format.json { render action: 'show', status: :created, admin: @saas_admin }
      else
        format.html { render action: 'new' }
        format.json { render json: @saas_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /a/users/1
  # PATCH/PUT /a/users/1.json
  def update
    respond_to do |format|
      if @saas_admin.update(params[:admin])
        format.html { redirect_to admin_users_path, notice: 'SaaS Admin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @saas_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /a/users/1
  # DELETE /a/users/1.json
  def destroy
    @saas_admin.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saas_admin
      @saas_admin = Admin.find(params[:id])
    end

end
