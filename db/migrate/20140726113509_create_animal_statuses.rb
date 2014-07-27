class CreateAnimalStatuses < ActiveRecord::Migration
  def change
    create_table :animal_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
