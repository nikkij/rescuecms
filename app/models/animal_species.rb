class AnimalSpecies < ActiveRecord::Base

  def species
  	self.name
  end

end