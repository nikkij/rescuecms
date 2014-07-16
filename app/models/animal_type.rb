class AnimalType < ActiveRecord::Base

  def type
  	self.name
  end

end