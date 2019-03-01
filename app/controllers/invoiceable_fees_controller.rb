class InvoiceableFeesController < ApplicationController
  before_action :set_invoiceable_fee, only: [:show, :edit, :update, :destroy]

  # GET /invoiceable_fees
  # GET /invoiceable_fees.json
  def index
    @invoiceable_fees = InvoiceableFee.all
  end

  # GET /invoiceable_fees/1
  # GET /invoiceable_fees/1.json
  def show
  end

  # GET /invoiceable_fees/new
  def new
    @invoiceable_fee = InvoiceableFee.new
  end

  # GET /invoiceable_fees/1/edit
  def edit
  end

  # POST /invoiceable_fees
  # POST /invoiceable_fees.json
  def create
    @invoiceable_fee = InvoiceableFee.new(invoiceable_fee_params)

    respond_to do |format|
      if @invoiceable_fee.save
        format.html { redirect_to @invoiceable_fee, notice: 'Invoiceable fee was successfully created.' }
        format.json { render :show, status: :created, location: @invoiceable_fee }
      else
        format.html { render :new }
        format.json { render json: @invoiceable_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoiceable_fees/1
  # PATCH/PUT /invoiceable_fees/1.json
  def update
    respond_to do |format|
      if @invoiceable_fee.update(invoiceable_fee_params)
        format.html { redirect_to @invoiceable_fee, notice: 'Invoiceable fee was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoiceable_fee }
      else
        format.html { render :edit }
        format.json { render json: @invoiceable_fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoiceable_fees/1
  # DELETE /invoiceable_fees/1.json
  def destroy
    @invoiceable_fee.destroy
    respond_to do |format|
      format.html { redirect_to invoiceable_fees_url, notice: 'Invoiceable fee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoiceable_fee
      @invoiceable_fee = InvoiceableFee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoiceable_fee_params
      params.require(:invoiceable_fee).permit(:guid, :product_code, :kind, :description, :required_at_move_in, :required_at_transfer, :amount, :short_description, :show_in_sales_center, :tax_total, :total)
    end
end
