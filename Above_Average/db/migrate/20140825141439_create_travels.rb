class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
    	t.float :walk
    	t.float :train
    	t.float :bus
    	t.float :car
    	t.float :plane
    	t.float :normalized_walk
    	t.float :normalized_train
    	t.float :normalized_bus
    	t.float :normalized_car
    	t.float :normalized_plane
    	t.float :total
      t.timestamps
    end
  end
end
