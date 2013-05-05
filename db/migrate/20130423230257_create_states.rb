class CreateStates < ActiveRecord::Migration
  def change
	create_table :states do |t|
	  t.string :country_iso_code
	  t.string :state_code
	  t.string :name

	  t.timestamps
	end
  end
end