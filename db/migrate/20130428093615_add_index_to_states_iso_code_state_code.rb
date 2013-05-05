class AddIndexToStatesIsoCodeStateCode < ActiveRecord::Migration
	def change
		add_index(:states, [:country_iso_code, :state_code])
	end
end