class AddPictureToAnimal < ActiveRecord::Migration
  def change
    add_column :animals, :picture, :string
  end
end
