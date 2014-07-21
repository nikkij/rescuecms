class ResidenceLocation < ActiveRecord::Base
  #has_one :locator, :as => :location
  #has_one :animal, :through => :locators

  acts_as :location

  def name
    "Residence Location"
  end

end