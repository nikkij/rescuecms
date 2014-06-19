class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :code
      t.string :short_code
      t.string :litter
      
      t.timestamps
    end
  end
end
