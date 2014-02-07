class Admins::SubscriptionPlansController < AdminsController
  before_action :set_subscription_plan, only: [:show, :edit, :update, :destroy]

  # GET /subscription_plans
  # GET /subscription_plans.json
  def index
    @subscription_plans = SubscriptionPlan.all
  end

  # GET /subscription_plans/1
  # GET /subscription_plans/1.json
  def show
  end

  # GET /subscription_plans/new
  def new
    @subscription_plan = SubscriptionPlan.new
  end

  # GET /subscription_plans/1/edit
  def edit
  end

  # POST /subscription_plans
  # POST /subscription_plans.json
  def create
    @subscription_plan = SubscriptionPlan.new(params[:subscription_plan])

    respond_to do |format|
      if @subscription_plan.save
        format.html { redirect_to admin_subscription_plans_path, notice: 'Subscription plan was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subscription_plan }
      else
        format.html { render action: 'new' }
        format.json { render json: @subscription_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscription_plans/1
  # PATCH/PUT /subscription_plans/1.json
  def update
    respond_to do |format|
      if @subscription_plan.update(params[:subscription_plan])
        format.html { redirect_to admin_subscription_plans_path, notice: 'Subscription plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subscription_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscription_plans/1
  # DELETE /subscription_plans/1.json
  def destroy
    @subscription_plan.destroy
    respond_to do |format|
      format.html { redirect_to admin_subscription_plans_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription_plan
      @subscription_plan = SubscriptionPlan.find(params[:id])
    end

end
