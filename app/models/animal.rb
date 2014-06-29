class Animal < ActiveRecord::Base
  belongs_to :animal_sex
  belongs_to :animal_type
  belongs_to :animal_color
  belongs_to :animal_coat_type
  belongs_to :animal_size
  belongs_to :animal_species
  belongs_to :animal_breed

  mount_uploader :picture, PictureUploader
end
