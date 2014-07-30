class AdminController < ApplicationController
  before_filter :count_animals

  protected
  
  def count_animals
  	@animal_count = Animal.all.count
  end

  def user_for_paper_trail
    'Unknown user'
  end

end
