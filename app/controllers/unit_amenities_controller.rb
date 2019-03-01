class UnitAmenitiesController < ApplicationController
  before_action :set_unit_amenity, only: [:show, :edit, :update, :destroy]

  # GET /unit_amenities
  # GET /unit_amenities.json
  def index
    @unit_amenities = UnitAmenity.all
  end

  # GET /unit_amenities/1
  # GET /unit_amenities/1.json
  def show
  end

  # GET /unit_amenities/new
  def new
    @unit_amenity = UnitAmenity.new
  end

  # GET /unit_amenities/1/edit
  def edit
  end

  # POST /unit_amenities
  # POST /unit_amenities.json
  def create
    @unit_amenity = UnitAmenity.new(unit_amenity_params)

    respond_to do |format|
      if @unit_amenity.save
        format.html { redirect_to @unit_amenity, notice: 'Unit amenity was successfully created.' }
        format.json { render :show, status: :created, location: @unit_amenity }
      else
        format.html { render :new }
        format.json { render json: @unit_amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_amenities/1
  # PATCH/PUT /unit_amenities/1.json
  def update
    respond_to do |format|
      if @unit_amenity.update(unit_amenity_params)
        format.html { redirect_to @unit_amenity, notice: 'Unit amenity was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit_amenity }
      else
        format.html { render :edit }
        format.json { render json: @unit_amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_amenities/1
  # DELETE /unit_amenities/1.json
  def destroy
    @unit_amenity.destroy
    respond_to do |format|
      format.html { redirect_to unit_amenities_url, notice: 'Unit amenity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_amenity
      @unit_amenity = UnitAmenity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_amenity_params
      params.require(:unit_amenity).permit(:guid, :name, :short_code, :show_in_sales_center_filter_dropdown)
    end
end
