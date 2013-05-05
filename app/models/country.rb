# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  iso_code   :string(255)
#

class Country < ActiveRecord::Base
  attr_accessible :iso_code, :name

  has_many :states

  validates :iso_code, presence: true, length: { maximum: 3 }, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { maximum: 50 }

  before_save { |country| country.iso_code = iso_code.upcase }
end
