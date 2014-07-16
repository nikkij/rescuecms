class AnimalColor < ActiveRecord::Base

  def color
  	self.name
  end

end