class Admins::SubscriptionPlansController < AdminsController
  before_action :set_subscription_plan, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # GET /a/subscription_plans
  def index
    @subscription_plans = SubscriptionPlan.all
  end

  # GET /a/subscription_plans/new
  def new
    @subscription_plan = SubscriptionPlan.new
  end

  # GET /a/subscription_plans/1/edit
  def edit
  end

  # POST /a/subscription_plans
  def create
    @subscription_plan = SubscriptionPlan.new(params[:subscription_plan])
    if @subscription_plan.save
      redirect_to admin_subscription_plans_path, notice: 'Subscription plan was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /a/subscription_plans/1
  def update
    if @subscription_plan.update(params[:subscription_plan])
      redirect_to admin_subscription_plans_path, notice: 'Subscription plan was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /a/subscription_plans/1
  def destroy
    @subscription_plan.destroy
    redirect_to admin_subscription_plans_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription_plan
      @subscription_plan = SubscriptionPlan.find_by_stripe_id(params[:id])
    end

end
