class AddAnimalStory < ActiveRecord::Migration
  def change
  	add_column :animals, :story, :text
  end
end
