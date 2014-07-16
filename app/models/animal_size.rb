class AnimalSize < ActiveRecord::Base

  def size
  	self.name
  end

end