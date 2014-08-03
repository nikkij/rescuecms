class Animal < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :animal_sex
  belongs_to :animal_type
  belongs_to :animal_color
  belongs_to :animal_coat_type
  belongs_to :animal_size
  belongs_to :animal_species
  belongs_to :animal_breed
  belongs_to :animal_status
  belongs_to :location

  accepts_nested_attributes_for :location

  delegate :sex, :to => :animal_sex, :allow_nil => true
  delegate :type, :to => :animal_type, :allow_nil => true
  delegate :color, :to => :animal_color, :allow_nil => true
  delegate :coat_type, :to => :animal_coat_type, :allow_nil => true
  delegate :size, :to => :animal_size, :allow_nil => true
  delegate :species, :to => :animal_species, :allow_nil => true
  delegate :breed, :to => :animal_breed, :allow_nil => true
  delegate :status, :to => :animal_status, :allow_nil => true

  has_paper_trail

  mount_uploader :picture, PictureUploader


  validates :code, presence: true
  validates :status, presence: true
  validates :type, presence: true
  validates :location_id, presence: true, :on => :create

  scope :adoptable, ->() {
    joins(:animal_status).where('animal_statuses.name' => "Adoptable") 
  }


  def self.search(search)
    if search
      where('name ILIKE ?', "%#{search}%")
    else
      where(nil)
    end
  end

  # def location_has_been_selected
  #   self.errors.add(:location_id,"must be valid. If you can't find the location, please create a new one")
  # end

end