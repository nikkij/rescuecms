class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations, :as_relation_superclass => true do |t|
    end

    create_table :residence_locations do |t|      
    end

    create_table :on_premises_locations do |t|     
    end

    create_table :organizational_locations do |t|
    end

    add_column :animals, :location_id, :integer

  end
end
