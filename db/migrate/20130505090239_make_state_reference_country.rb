class MakeStateReferenceCountry < ActiveRecord::Migration
  def change
  	change_table :states do |s|
  		s.references :country
  	end
  end
end
