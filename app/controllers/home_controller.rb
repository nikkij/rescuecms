class HomeController < ApplicationController
  def index
    @animals = Animal.adoptable.take 12
  end
end
