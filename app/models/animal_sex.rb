class AnimalSex < ActiveRecord::Base

  def sex
  	self.name
  end

end