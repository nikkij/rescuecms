class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show]

  # GET /animals
  # GET /animals.json
  def index
    @animals = Animal.adoptable
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
    @animals = Animal.adoptable.take 6
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

end
