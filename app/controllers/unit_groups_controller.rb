class UnitGroupsController < ApplicationController
  before_action :set_unit_group, only: [:show, :edit, :update, :destroy]

  # GET /unit_groups
  # GET /unit_groups.json
  def index
    @unit_groups = UnitGroup.all
  end

  # GET /unit_groups/1
  # GET /unit_groups/1.json
  def show
  end

  # GET /unit_groups/new
  def new
    @unit_group = UnitGroup.new
  end

  # GET /unit_groups/1/edit
  def edit
  end

  # POST /unit_groups
  # POST /unit_groups.json
  def create
    @unit_group = UnitGroup.new(unit_group_params)

    respond_to do |format|
      if @unit_group.save
        format.html { redirect_to @unit_group, notice: 'Unit group was successfully created.' }
        format.json { render :show, status: :created, location: @unit_group }
      else
        format.html { render :new }
        format.json { render json: @unit_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_groups/1
  # PATCH/PUT /unit_groups/1.json
  def update
    respond_to do |format|
      if @unit_group.update(unit_group_params)
        format.html { redirect_to @unit_group, notice: 'Unit group was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit_group }
      else
        format.html { render :edit }
        format.json { render json: @unit_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_groups/1
  # DELETE /unit_groups/1.json
  def destroy
    @unit_group.destroy
    respond_to do |format|
      format.html { redirect_to unit_groups_url, notice: 'Unit group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_group
      @unit_group = UnitGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_group_params
      params.require(:unit_group).permit(:guid, :price, :group_key, :name, :available_units_count, :total_units_count, :total_non_excluded_units_count, :size, :standard_rate, :floor, :reduced_price, :occupancy_percent, :area, :length, :width, :height, :due_at_move_in, :due_at_move_in_without_fees, :due_monthly, :attribute_description, :description, :average_rent, :active_rate_type, :channel_rate_id, :unit_type_id)
    end
end
