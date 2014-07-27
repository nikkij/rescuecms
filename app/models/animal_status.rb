class AnimalStatus < ActiveRecord::Base
  def status
  	self.name
  end	
end
