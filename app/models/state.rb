
class State < ActiveRecord::Base
	attr_accessible :country_iso_code, :state_code, :name

	belongs_to :country

	validates :country_iso_code, presence: true, length: { maximum: 3 }
	validates :state_code, presence: true
	validates :name, presence: true, length: { maximum: 50 }

	validates_uniqueness_of :state_code, :scope => [:country_iso_code]

	before_save do |state| 
		state.country_iso_code = country_iso_code.upcase
		state.state_code = state_code.upcase
	end
end