class AddTotalToRecyclings < ActiveRecord::Migration
  def change
  	add_column :recyclings, :total, :integer
  end
end
