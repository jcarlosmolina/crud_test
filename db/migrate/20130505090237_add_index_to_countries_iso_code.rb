class AddIndexToCountriesIsoCode < ActiveRecord::Migration
  def change
  	add_index :countries, :iso_code, :unique => true
  end
end
