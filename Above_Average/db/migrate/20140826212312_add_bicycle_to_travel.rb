class AddBicycleToTravel < ActiveRecord::Migration
  def change
  	add_column :travels, :bicycle, :float
  	add_column :travels, :normalized_bicycle, :float
  end
end
