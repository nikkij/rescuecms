class Admin::LocationsController < AdminController

before_action :set_location, only: [:show, :edit, :update, :destroy]
  #before_action :set_location

  # GET /locations
  # GET /locations.json
  def index
    #@locations = Location.all
    @locations = Location.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    # pass through to polymorphic child
    render "show"+@location.class.name.downcase
  end

  # GET /locations/new
  def new
    @location = Location.new
    @address = Address.new #this is only needed for residence locations though, surely there is a better way to do this?
  end

  # GET /locations/1/edit
  def edit
    # pass through to polymorphic child
    render "edit"+@location.class.name.downcase
  end

  # POST /locations
  # POST /locations.json
  def create
    location_type = params[:location][:as_location_type]
    strong_params_method_to_call = location_type+'_params'
    @location = location_type.classify.constantize.new(self.send(strong_params_method_to_call.to_sym))
    respond_to do |format|
      if @location.save
        format.html { redirect_to [:admin,Location.new], notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    location_type = params[:location][:as_location_type]
    strong_params_method_to_call = location_type+'_params'  
    respond_to do |format|
      if @location.update(self.send(strong_params_method_to_call.to_sym))
        format.html { redirect_to [:admin,@location], notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      resource, id = request.path.split('/')[2,3]
      @location = resource.singularize.classify.constantize.find(id)
      #@location = Location.find(params[:id])
    end

    #def get_location(locator)
    #  locator.location_type.classify.constantize.find(locator.location_id)
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      #params.require(:location).permit(:name,:as_location_type,:area,:unit)
      #params.require(:on_premises_location).permit!
      params.require(:location).permit(:name,:as_location_type)
    end

    def on_premises_location_params
      params.require(:on_premises_location).permit(:area,:unit)
    end

    def residence_location_params
      params.require(:residence_location).permit(:address_attributes => [:street,:city,:state_id,:zip_code,:id])
    end

end
