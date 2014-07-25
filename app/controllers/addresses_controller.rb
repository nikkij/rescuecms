class AddressesController < ApplicationController
  before_action :set_address, only: [:show]

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:street, :addressable_id, :addressable_type)
    end
end