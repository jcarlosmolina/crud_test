class AddIsoCodeToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :iso_code, :string
  end
end
