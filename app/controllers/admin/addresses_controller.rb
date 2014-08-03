class Admin::AddressesController < AdminController
  before_filter :require_login
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to [:admin,@address], notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to [:admin,@address], notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /addresses/autocomplete
  # Take out the join and move to residence controller when we set up inherited controllers like we should
  def autocomplete
    @addresses = Address.joins('LEFT OUTER JOIN residence_locations ON addresses.addressable_id = residence_locations.id').where("street ILIKE ?", "%#{params[:term]}%").order(:street)
    respond_to do |format|
      format.html
      format.json { 
        #render json: @addresses.map(&:street)
        #render json: @addresses.map{ |a| { :label => a[:street], :value => a[:id] } }.to_json
        render json: @addresses.map{ |a| { :label => a[:street], :value => ResidenceLocation.find(a[:addressable_id]).location.id.to_s } }.to_json
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:street, :addressable_id, :addressable_type, :term)
    end
end
