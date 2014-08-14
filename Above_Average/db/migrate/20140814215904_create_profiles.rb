class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.integer :age
    	t.integer :zip

      t.timestamps
    end
  end
end
