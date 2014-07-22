class Animal < ActiveRecord::Base
  belongs_to :animal_sex
  belongs_to :animal_type
  belongs_to :animal_color
  belongs_to :animal_coat_type
  belongs_to :animal_size
  belongs_to :animal_species
  belongs_to :animal_breed
  belongs_to :location

  accepts_nested_attributes_for :location

  delegate :sex, :to => :animal_sex, :allow_nil => true
  delegate :type, :to => :animal_type, :allow_nil => true
  delegate :color, :to => :animal_color, :allow_nil => true
  delegate :coat, :to => :animal_coat_type, :allow_nil => true
  delegate :size, :to => :animal_size, :allow_nil => true
  delegate :species, :to => :animal_species, :allow_nil => true
  delegate :breed, :to => :animal_breed, :allow_nil => true

  mount_uploader :picture, PictureUploader
end