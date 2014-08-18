class CreateUtilities < ActiveRecord::Migration
  def change
    create_table :utilities do |t|
    	t.integer :kwh
    	t.integer :therms
    	t.integer :gallons
    	t.integer :user_id
      t.timestamps
    end
  end
end
