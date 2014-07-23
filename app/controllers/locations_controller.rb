class LocationsController < ApplicationController
  before_action :set_location, only: [:show]

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      #resource, id = request.path.split('/')[1,2]
      #@location = resource.singularize.classify.constantize.find(id)
      @location = Location.find(params[:id])
    end
end
