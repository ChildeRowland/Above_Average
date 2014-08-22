class AddNormalizeToUtilities < ActiveRecord::Migration
  def change
  	add_column :utilities, :normalized_kwh, :float
  	add_column :utilities, :normalized_therms, :float
  	add_column :utilities, :normalized_gallons, :float
  	add_column :utilities, :total, :float
  end
end
