class AddAnimalProperties < ActiveRecord::Migration
  def change
    create_table :animal_sexes do |t|
      t.string :name
      t.timestamps
    end

    create_table :animal_types do |t|
      t.string :name
      t.timestamps
    end

    create_table :animal_colors do |t|
      t.string :name
      t.timestamps
    end

    create_table :animal_coat_types do |t|
      t.string :name
      t.timestamps
    end    

    create_table :animal_sizes do |t|
      t.string :name
      t.timestamps
    end

    create_table :animal_species do |t|
      t.string :name
      t.timestamps
    end

    create_table :animal_breeds do |t|
      t.string :name
      t.integer :animal_species_id
      t.timestamps
    end
  end
end