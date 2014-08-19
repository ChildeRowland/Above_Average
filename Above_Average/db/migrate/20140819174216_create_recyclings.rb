class CreateRecyclings < ActiveRecord::Migration
  def change
    create_table :recyclings do |t|
    	t.integer :local	
    	t.integer :compost
    	t.integer :fabric
    	t.integer :ewaste
    	t.integer :user_id
      t.timestamps
    end
  end
end
