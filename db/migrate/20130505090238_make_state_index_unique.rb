class MakeStateIndexUnique < ActiveRecord::Migration
  def up
  	# Remove existing index as it is not unique yet
  	remove_index(:states, [:country_iso_code, :state_code])
  	# Create the index again, this time making it unique
  	add_index(:states, [:country_iso_code,:state_code], {:unique => true})
  end

  def down
  	# Remove existing unique index
  	remove_index(:states, [:country_iso_code, :state_code])
  	# Create the index again, this time not making it unique (thus reverting to the old version of it)
  	add_index(:states, [:country_iso_code, :state_code])
  end
end
