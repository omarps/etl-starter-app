class ChannelRatesController < ApplicationController
  before_action :set_channel_rate, only: [:show, :edit, :update, :destroy]

  # GET /channel_rates
  # GET /channel_rates.json
  def index
    @channel_rates = ChannelRate.all
  end

  # GET /channel_rates/1
  # GET /channel_rates/1.json
  def show
  end

  # GET /channel_rates/new
  def new
    @channel_rate = ChannelRate.new
  end

  # GET /channel_rates/1/edit
  def edit
  end

  # POST /channel_rates
  # POST /channel_rates.json
  def create
    @channel_rate = ChannelRate.new(channel_rate_params)

    respond_to do |format|
      if @channel_rate.save
        format.html { redirect_to @channel_rate, notice: 'Channel rate was successfully created.' }
        format.json { render :show, status: :created, location: @channel_rate }
      else
        format.html { render :new }
        format.json { render json: @channel_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channel_rates/1
  # PATCH/PUT /channel_rates/1.json
  def update
    respond_to do |format|
      if @channel_rate.update(channel_rate_params)
        format.html { redirect_to @channel_rate, notice: 'Channel rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel_rate }
      else
        format.html { render :edit }
        format.json { render json: @channel_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channel_rates/1
  # DELETE /channel_rates/1.json
  def destroy
    @channel_rate.destroy
    respond_to do |format|
      format.html { redirect_to channel_rates_url, notice: 'Channel rate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel_rate
      @channel_rate = ChannelRate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_rate_params
      params.require(:channel_rate).permit(:base_rate_type, :modifier_type, :turned_on, :turned_off_on, :rate, :amount, :channel_name, :channel_guid, :facility_guid)
    end
end
