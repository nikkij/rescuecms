class AnimalBreed < ActiveRecord::Base
  belongs_to :animal_species

  def breed
  	self.name
  end
end