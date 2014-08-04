class Admin::AnimalsController < AdminController
  before_filter :require_login
  before_action :set_animal, only: [:show, :move, :update_location, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /animals
  # GET /animals.json
  def index
    @animals = Animal.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)
    #@animals = Animal.order(params[:sort]).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
  end

# GET /animals/new
  def new
    @animal = Animal.new
    @animal.code = DateTime.now.to_i
  end

  # GET /animals/1/edit
  def edit
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(animal_params)
    # if params[:location][:as_location_type]
      # location_type = params[:location][:as_location_type]
      # strong_params_method_to_call = location_type+'_params'
      # if !params[location_type][:id].blank?
        # @animal.location = location_type.classify.constantize.find(params[location_type][:id]).location
      # else
      # 
      # end
    # end

    respond_to do |format|
      if @animal.save
        @animal.create_activity :create, owner: current_user
        format.html { redirect_to [:admin,@animal], notice: 'Animal was successfully created.' }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to [:admin, @animal], notice: 'Animal was successfully updated.' }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /animals/1/move
  def move
    @location = @animal.location
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  # Merge this back in with the regular update
  def update_location
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to [:admin, @animal], notice: 'Animal was successfully moved.' }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to admin_animals_url, notice: 'Animal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_params
      params.require(:animal).permit(:name,:picture_cache, :picture, :code, :short_code, :litter,
              :animal_sex_id, :animal_type_id, :animal_color_id, :animal_coat_type_id, :animal_size_id,
              :animal_species_id, :animal_breed_id, :animal_status_id, :location_id, :story)
    end

    def location_params
      params.require(:location).permit(:as_location_type,:as_location_id)
    end

    def on_premises_location_params
      params.require(:on_premises_location).permit(:area,:unit)
    end

    def sort_column  
      params[:sort] || "name"  
    end  
    
    def sort_direction  
      params[:direction] || "asc"  
    end 

end
