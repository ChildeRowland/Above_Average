class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.integer :age
    	t.integer :zip
    	t.integer :total_household_members
    	t.string :fname

      t.timestamps
    end
  end
end
