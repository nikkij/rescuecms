class AnimalCoatType < ActiveRecord::Base

  def coat_type
  	self.name
  end

end