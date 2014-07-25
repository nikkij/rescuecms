class ResidenceLocation < ActiveRecord::Base
  has_one :address, :as => :addressable

  accepts_nested_attributes_for :address

  acts_as :location

  def name
    "Residence"
  end

  def description
    if self.address then
      self.address.street
    else
      "No Address"
    end
  end

end