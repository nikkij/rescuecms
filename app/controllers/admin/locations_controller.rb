class Admin::LocationsController < AdminController

before_action :set_location, only: [:show, :edit, :update, :destroy]
  #before_action :set_location

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
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
  end

  # GET /locations/1/edit
  def edit
    # pass through to polymorphic child
    render "edit"+@location.class.name.downcase
  end

  # POST /locations
  # POST /locations.json
  def create
    #@location = Location.new(location_params)
    @location = params[:location][:as_location_type].classify.constantize.new(location_params)
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
    respond_to do |format|
      if @location.update(location_params)
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
      params.require(:location).permit(:name,:location_type)
    end

end
