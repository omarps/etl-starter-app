class DiscountPlansController < ApplicationController
  before_action :set_discount_plan, only: [:show, :edit, :update, :destroy]

  # GET /discount_plans
  # GET /discount_plans.json
  def index
    @discount_plans = DiscountPlan.all
  end

  # GET /discount_plans/1
  # GET /discount_plans/1.json
  def show
  end

  # GET /discount_plans/new
  def new
    @discount_plan = DiscountPlan.new
  end

  # GET /discount_plans/1/edit
  def edit
  end

  # POST /discount_plans
  # POST /discount_plans.json
  def create
    @discount_plan = DiscountPlan.new(discount_plan_params)

    respond_to do |format|
      if @discount_plan.save
        format.html { redirect_to @discount_plan, notice: 'Discount plan was successfully created.' }
        format.json { render :show, status: :created, location: @discount_plan }
      else
        format.html { render :new }
        format.json { render json: @discount_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discount_plans/1
  # PATCH/PUT /discount_plans/1.json
  def update
    respond_to do |format|
      if @discount_plan.update(discount_plan_params)
        format.html { redirect_to @discount_plan, notice: 'Discount plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @discount_plan }
      else
        format.html { render :edit }
        format.json { render json: @discount_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discount_plans/1
  # DELETE /discount_plans/1.json
  def destroy
    @discount_plan.destroy
    respond_to do |format|
      format.html { redirect_to discount_plans_url, notice: 'Discount plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount_plan
      @discount_plan = DiscountPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discount_plan_params
      params.require(:discount_plan).permit(:guid, :name, :description, :public_description, :availability_text, :requirements_text, :kind, :min_occupancy_required, :min_occupancy_months, :prepay_required, :prepay_months, :start_date, :end_date, :auto_apply, :promotion_type, :deleted, :turned_on, :available_for_all_facilities, :round_to_nearest, :hide_from_website, :move_in_only, :tenant_account_kind_guid, :existing_tenant_only, :priority, :role_permission, :api_association_guids, :always_discount_plan_discount_guid)
    end
end
