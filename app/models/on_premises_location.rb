class OnPremisesLocation < ActiveRecord::Base
  #has_one :locator, :as => :location
  #has_one :animal, :through => :locators

  acts_as :location

  def name
    "On Presmises"
  end

end