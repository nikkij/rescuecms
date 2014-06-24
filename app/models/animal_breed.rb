class AnimalBreed < ActiveRecord::Base
  belongs_to :animal_species
end