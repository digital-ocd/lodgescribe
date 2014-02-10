class Accounts::LodgesController < AccountsController
  before_action :verify_lodge_ability, except: [:show]

  # GET /:sub_domain
  # GET /:sub_domain.json
  def show
  end

  # GET /:sub_domain/edit
  def edit
  end

  # PATCH/PUT /:sub_domain
  # PATCH/PUT /:sub_domain.json
  def update
    respond_to do |format|
      if current_lodge.update(params[:lodge])
        format.html { redirect_to lodge_path(current_lodge), notice: 'Lodge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: current_lodge.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def verify_lodge_ability
    raise ApplicationController::Unauthorized unless current_user.can_admin?(current_lodge)
  end

end
