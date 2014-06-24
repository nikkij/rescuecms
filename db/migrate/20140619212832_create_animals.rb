class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :code
      t.string :short_code
      t.string :litter
      t.integer :animal_sex_id
      t.integer :animal_type_id
      t.integer :animal_color_id
      t.integer :animal_coat_type_id
      t.integer :animal_size_id
      t.integer :animal_species_id
      t.integer :animal_breed_id
      
      t.timestamps
    end
  end
end
