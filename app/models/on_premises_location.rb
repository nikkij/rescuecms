class OnPremisesLocation < ActiveRecord::Base

  acts_as :location

  validates :area, presence: true
  
  def name
    "On Presmises"
  end

  def description
    self.area.to_s + ":" + self.unit.to_s
  end

end